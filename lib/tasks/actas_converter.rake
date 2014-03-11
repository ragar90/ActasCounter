require 'RMagick'
desc "Convierte los pdf a imagenes" 
task :actas_converter => :environment do
  dir = "#{Rails.root}/lib/actas"
  actas_dir = Dir.new(dir)
  actas_dir.each do |folder|
    unless folder == "." or folder == ".." or folder == ".DS_Store"
      subdir_1 = "#{dir}/#{folder}"
      actas_subdir_1 = Dir.new(subdir_1)
      actas_subdir_1.each do |subfolder1|
        unless subfolder1 == "." or subfolder1 == ".." or subfolder1 == ".DS_Store"
          subdir_2 = "#{subdir_1}/#{subfolder1}"
          actas_subdir_2 = Dir.new(subdir_2)
          actas_subdir_2.each do |subfolder2|
            unless subfolder2 == "." or subfolder2 == ".." or subfolder2 == ".DS_Store"
              subdir_3 = "#{subdir_2}/#{subfolder2}"
              actas_subdir_3 = Dir.new(subdir_3)
              puts "====>converting #{subdir_3} pdf..."
              actas_subdir_3.each do |acta_pdf_filename|
                unless acta_pdf_filename == "." or acta_pdf_filename == ".." or acta_pdf_filename == ".DS_Store"
                  puts "processing #{acta_pdf_filename}."
                  acta_pdf_path = "#{subdir_3}/#{acta_pdf_filename}"
                  pdf = Magick::ImageList.new(acta_pdf_path)
                  actata_image_name = acta_pdf_filename.gsub("pdf","jpg")
                  image_path = "#{Rails.root}/lib/actas_images/#{actata_image_name}"
                  pdf.write(image_path)
                end
              end
              actas_subdir_3.close
            end
          end
          actas_subdir_2.close
        end
      end
      actas_subdir_1.close
    end
  end
  actas_dir.close
end
#Last One actas/04/04/19/PRE04041905155.pdf