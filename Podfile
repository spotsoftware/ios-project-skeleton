# { Configuration

# The project name
$project_name = "SPTSkeleton"

# }

xcodeproj "#{$project_name}/#{$project_name}.xcodeproj"

link_with [$project_name]

inhibit_all_warnings!

# All dependencies should be listed in this subspec for ease of mainentance
podspec :name => "#{$project_name}/Dependencies", :path => "./#{$project_name}.podspec"
