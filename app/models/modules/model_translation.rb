module Modules::ModelTranslation
  def self.included(base)
    base.class_eval do
      def method_missing(meth, *args, &block)
        locale = I18n.locale || I18n.default_locale
        if self.respond_to?("#{meth}_#{locale}")
          self.send("#{meth}_#{locale}".to_sym)
        else
          super
        end
      end
    end
  end
end