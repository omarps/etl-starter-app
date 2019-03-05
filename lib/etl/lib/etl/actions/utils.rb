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
      
      def self.ar_belongs_to_id(ar_class, source, field='guid')
        ar_class.find_by(guid: source[field])&.id unless source.nil?
      end
      
      def self.ar_has_many_save!(ar_one_class, guid, ar_many_class, many_attribute, many_array, key='guid')
        return unless ar_one_class.exists?(guid: guid) || !many_array.empty?
        # return unless ::DiscountPlan.exists?(guid: guid) || !discount_plan_discounts.empty?
        ar_one = ar_one_class.find_by(guid: guid)
        # discount_plan = ::DiscountPlan.find_by(guid: guid)
        many_ids = []
        many_array.each do |many|
          # ar_one.many_attribute(many_attribute) << ar_many_class.find_by(guid: many[key])
          many_ids << ar_many_class.find_by(guid: many[key])
        end
        ar_one.update_attribute(many_attribute, many_ids)
        # discount_plan_discounts.each do |discount|
        #   discount_plan.discounts << ::Discount.find_by(guid: discount['guid'])
        # end
        # discount_plan.save!
      end
    end
  end
end
