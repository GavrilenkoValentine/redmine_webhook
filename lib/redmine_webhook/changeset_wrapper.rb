module RedmineWebhook
  class ChangesetWrapper
    def initialize(changeset)
      @changeset = changeset
    end

    def to_hash
      {
        :id => @changeset.id,
        :committer => @changeset.committer,
        :committed_on => @changeset.committed_on,
        :commit_link => link(@changeset),
      }
    end


    private
    def link(changeset)
      repository = changeset.repository

  		if Setting.host_name.to_s =~ /\A(https?\:\/\/)?(.+?)(\:(\d+))?(\/.+)?\z/i
  			host, port, prefix = $2, $4, $5
  			revision_url = Rails.application.routes.url_for(
  				:controller => 'repositories',
  				:action => 'revision',
  				:id => repository.project,
  				:repository_id => repository.identifier_param,
  				:rev => changeset.revision,
  				:host => host,
  				:protocol => Setting.protocol,
  				:port => port,
  				:script_name => prefix
  			)
  		else
  			revision_url = Rails.application.routes.url_for(
  				:controller => 'repositories',
  				:action => 'revision',
  				:id => repository.project,
  				:repository_id => repository.identifier_param,
  				:rev => changeset.revision,
  				:host => Setting.host_name,
  				:protocol => Setting.protocol
  			)
  		end
      commit_link = "<#{revision_url}|#{changeset.comments}>"
      commit_link
    end
  end
end
