module RedmineWebhook
  class WebhookListener < Redmine::Hook::Listener

    def controller_issues_new_after_save(context = {})
      issue = context[:issue]
      controller = context[:controller]
      project = issue.project
      webhooks = Webhook.where(:project_id => project.project.id)
      return unless webhooks
      post(webhooks, issue_to_json(issue, controller))
    end

    # --- Added Gavrilenko_Valentine ---
    def controller_issues_bulk_edit_after_save(context = {})
      journal = context[:journal]
      controller = context[:controller]
      issue = context[:issue]
      project = issue.project
      webhooks = Webhook.where(:project_id => project.project.id)
      return unless webhooks
      post(webhooks, journal_to_json(issue, journal, controller))
    end
    #--- end ---

    def controller_issues_edit_after_save(context = {})
      journal = context[:journal]
      controller = context[:controller]
      issue = context[:issue]
      project = issue.project
      webhooks = Webhook.where(:project_id => project.project.id)
      return unless webhooks
      post(webhooks, journal_to_json(issue, journal, controller))
    end

    #--- Added by Gavrilenko_Valentine ---
    def model_changeset_scan_commit_for_issue_ids_pre_issue_update(context={})
		issue = context[:issue]
		journal = issue.current_journal
		changeset = context[:changeset]
    action = context[:action]
    project = issue.project
    webhooks = Webhook.where(:project_id => project.project.id)
		return unless webhooks
    post(webhooks, git_changeset_to_json(issue, journal, changeset, action))
	end
    #---end---


    private
    def issue_to_json(issue, controller)
      {
        :payload => {
          :action => 'opened',
          :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash,
          :url => controller.issue_url(issue)
        }
      }.to_json
    end

    def journal_to_json(issue, journal, controller)
      {
        :payload => {
          :action => 'updated',
          :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash,
          :journal => RedmineWebhook::JournalWrapper.new(journal).to_hash,
          :url => controller.issue_url(issue)
        }
      }.to_json
    end

    # --- Added by Gavrilenko_Valentine ---
    def git_changeset_to_json(issue, journal, changeset, action)
      {
        :payload => {
          :action => 'changeset',
          :changeset_action => action,
          :issue => RedmineWebhook::IssueWrapper.new(issue).to_hash,
          :changeset => RedmineWebhook::ChangesetWrapper.new(changeset).to_hash,
          :journal => RedmineWebhook::JournalWrapper.new(journal).to_hash
        }
      }.to_json
    end
    #---end---

    def post(webhooks, request_body)
      Thread.start do
        webhooks.each do |webhook|
          begin
            Faraday.post do |req|
              req.url webhook.url
              req.headers['Content-Type'] = 'application/json'
              req.body = request_body
            end
          rescue => e
            Rails.logger.error e
          end
        end
      end
    end
  end
end
