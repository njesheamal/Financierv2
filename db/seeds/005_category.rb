require 'faker'

Category.destroy_all
print "Categories have been reset." if Category.count == 0

7.times do 
    Category.create!(
        title: Faker::DcComics.hero
    )
end


print "#{Category.count} have been created."
