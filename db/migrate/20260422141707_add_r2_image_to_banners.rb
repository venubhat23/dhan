class AddR2ImageToBanners < ActiveRecord::Migration[8.0]
  def change
    add_column :banners, :r2_image_key, :string
    add_column :banners, :r2_image_filename, :string
    add_column :banners, :r2_image_content_type, :string
    add_column :banners, :r2_image_size, :bigint
    add_column :banners, :r2_additional_images, :text
  end
end
