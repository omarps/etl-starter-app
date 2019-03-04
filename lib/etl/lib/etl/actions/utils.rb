module Etl
  module Actions
    module Utils
      def self.ar_create(ctx, ar_class, attributes, field=:guid, key='guid')
        return if ar_class.exists?(field => attributes[key])
        object = ar_class.create(attributes)
        unless object.persisted?
          ctx.fail!("#{ar_class} was not persisted. attributes: #{attributes}.")
        end
      end
    end
  end
end
