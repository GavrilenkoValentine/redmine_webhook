module RedmineWebhook
  class CFWrapper
    def initialize(custom_field)
      @cf = custom_field
    end

    def to_hash
      {
        :id => @cf.custom_field.id,
        :name => @cf.custom_field.name,
        :value => @cf.value
      }
    end
  end
end
