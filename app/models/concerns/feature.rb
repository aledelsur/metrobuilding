# frozen_string_literal: true

# Steps to add a new feature:
# 1. Add the name and id of the feature to the enum hash.
# 2. Add the feature data (value_type and usable_in_departments) to the FEATURES_DATA hash.
#    Follow the same numbering as used in the feature enum.
# 3. Create a migration and add CompanyCategoryFeatureDefault records. i.e
#    CompanyCategoryFeatureDefault.create(feature: 'departments')
#    (Use 20180513214746_add_strong_passwords_feature.rb as a template)
# 4. Run your migration, and make sure it rolls back in development before committing it.
# 5. Go through the codebase and replace any existing code with references to the new feature.
#
module Concerns
  module Feature
    extend ActiveSupport::Concern

    included do
      # For more information about enums: http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
      # Add new features here:
      enum feature:
               {
                 logo: 0,
                 payments: 1,
                 newsletters: 2,
                 newsletters_history: 3,
                 client_portal: 4,
                 budget_rates: 5,
                 intranet_name: 6
               }

      validates_presence_of :string_value, if: :string_value_type?
      validates_presence_of :datetime_value, if: :datetime_value_type?
      validates_presence_of :integer_value, if: :integer_value_type?
    end

    class_methods do
      # Add features data here:
      FEATURES_DATA = {
        logo: {
          value_type: 'String',
          default_value: 'buildit.png'
        },
        payments: {
          value_type: 'Boolean',
          default_value: true
        },
        newsletters: {
          value_type: 'Boolean',
          default_value: true
        },
        newsletters_history: {
          value_type: 'Boolean',
          default_value: true
        },
        client_portal: {
          value_type: 'Boolean',
          default_value: true
        },
        budget_rates: {
          value_type: 'Boolean',
          default_value: false
        },
        intranet_name: {
          value_type: 'String',
          default_value: 'Intranet'
        }
      }.freeze

      def feature_value_type(feature)
        FEATURES_DATA[feature.to_sym][:value_type]
      end

      def feature_default_value(feature)
        FEATURES_DATA[feature.to_sym][:default_value]
      end
    end

    def value_type
      FEATURES_DATA[feature.to_sym][:value_type] if feature && FEATURES_DATA[feature.to_sym]
    end

    def string_value_type?
      value_type == 'String'
    end

    def datetime_value_type?
      value_type == 'Datetime'
    end

    def integer_value_type?
      value_type == 'Integer'
    end

    def boolean_value_type?
      value_type == 'Boolean'
    end
  end
end
