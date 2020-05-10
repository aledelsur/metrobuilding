class Admin::PaginatorSerializer < ActiveModel::Serializer

  attributes  :total,
              :current_page,
              :total_pages,
              :serialized_records

end