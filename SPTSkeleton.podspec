# { Configuration

# The project name
$project_name = "SPTSkeleton"

# In order to use this project as a dependency, there should be a tag with this name.
# That tag will be used as the source code for the dependency.
$project_version = "1.0.0"

# The project summary
$project_summary = "This is the summary of the SPTSkeleton project"

# The path for the readme file
$readme_file_path = File.join(__FILE__, "README.md")

# The project homepage
$homepage = "http://github.com/spotsoftware/#{$project_name.downcase.gsub('_', '-')}"

# The license name
$license_name = "Apache License, Version 2.0"

# The platform identifier (a.k.a. the sdk to be used)
$platform_id = "7.0"

# The deployment target
$deployment_target = $platform_id

# The authors
$authors = {
  "Marco Ceccarelli"  => "marco.ceccarelli@spot.it",
  "Luca Giorgetti"    => "luca.giorgetti@spot.it",
  "Alessandro Molari" => "alessandro.molari@spot.it",
  "Lorenzo Brasini"   => "lorenzo.brasini@spot.it"
}

# The repository containing the project
$repository = "git@github.com:spotsoftware/#{$project_name.downcase.gsub('_', '-')}.git"

# A list of system frameworks that the user's target needs to link against
$frameworks = ['CoreGraphics', 'UIKit', 'Foundation']

# The libraries that the user target (application) needs to link against
# (note: libraries do not include the lib prefix of their name)
$libraries = nil

# A list of resources included with the Pod. These are copied into the target bundle with
# a build phase script
$resources = nil

# A list of paths that should be preserved (not cleaned up during the build phase)
$preserve_paths = nil

# If your library depends on compiler flags you can set them in the xcconfig hash where they will only apply to your library
$xcconfig = nil

# Is automatic reference counting enabled?
$is_arc_enabled = true

# Dependencies (as a hash)
$dependencies = [
  { :name => "CocoaLumberjack", :version => "~>1.8.0" },
  { :name => "RBStoryboardLink", :version => "~>0.0.8" }
]

# }


Pod::Spec.new do |s|

  s.name                  = $project_name
  s.version               = $project_version
  s.summary               = $project_summary
  s.homepage              = $homepage
  s.license               = { :type => $license_name, :file => "LICENSE" }
  s.authors               = $authors
  s.ios.deployment_target = $deployment_target
  s.platform              = :ios, $platform_id
  s.source                = { :git => $repository, :tag => $project_version }

  if File.exist?($readme_file_path)
    File.open($readme_file_path, "r") do |readme_file|
      s.description = readme_file.read()
    end
  else
    s.description = "SPTSkeleton"
  end

  # s.source_files        = 'Classes', 'Classes/**/*.{h,m}'
  # s.exclude_files       = 'Classes/Exclude'
  # s.public_header_files = 'Classes/**/*.h'

  s.frameworks = $frameworks unless $frameworks.nil?
  s.libraries  = $libraries unless $libraries.nil?

  s.resources      = $resources unless $resources.nil?
  s.preserve_paths = $preserve_paths unless $preserve_paths.nil?

  s.requires_arc = $is_arc_enabled
  s.xcconfig     = $xcconfig unless $xcconfig.nil?

  s.default_subspec = "Default"

  s.subspec "Default" do |ss|
    puts $project_name
    ss.dependency "#{$project_name}/Dependencies"
  end

  s.subspec "Dependencies" do |ss|
    unless $dependencies.nil?
      $dependencies.each { |dep| ss.dependency(dep[:name], dep[:version]) }
    end
  end

end
