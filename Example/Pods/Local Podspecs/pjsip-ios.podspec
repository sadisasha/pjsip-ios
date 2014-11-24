Pod::Spec.new do |s|
  s.name             = "pjsip-ios"
  s.version          = "0.1.3"
  s.summary          = "PJSIP for ios"
  s.description      = <<-DESC
                       Other pods for pjsip were just not in a stable state. So I am creating a new one.
                       DESC
  s.homepage         = "https://github.com/petester42/pjsip-ios.git"
  s.license          = 'MIT'
  s.author           = { "Pierre-Marc Airoldi" => "pierremarcairoldi@gmail.com" }
  s.source           = { :git => "https://github.com/petester42/pjsip-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/petester42'

  s.platform     = :ios, '6.0'
  s.requires_arc = false
  s.dependency 'OpenSSL-Universal', '1.0.1.j-2'
  
  s.xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'PJ_AUTOCONF=1'
  }

  s.public_header_files = 'Pod/Headers/*.{h,hpp}'
  s.source_files = 'Pod/Headers/**/**/*.{h,hpp}'

  s.subspec 'pj' do |ss|
      
      ss.header_dir = 'pj'
      ss.frameworks = 'CFNetwork'
      ss.public_header_files = 'Pod/Headers/pj/*.{h,hpp}'
      ss.vendored_libraries = 'Pod/Lib/pjlib/*.a'

      ss.subspec 'compat' do |sss|
        
        sss.header_dir = 'pj/compat'
        sss.frameworks = 'CFNetwork'
        sss.public_header_files = 'Pod/Headers/pj/compat/*.{h,hpp}'
        sss.vendored_libraries = 'Pod/Lib/pjlib/*.a'

      end

  end

  s.subspec 'pjlib-util' do |ss|
     
      ss.header_dir = 'pjlib-util'
      ss.public_header_files = 'Pod/Headers/pjlib-util/*.{h,hpp}'
      ss.vendored_libraries = 'Pod/Lib/pjlib-util/*.a'

      ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pj++' do |ss|
     
    ss.header_dir = 'pj++'
    ss.frameworks = 'CFNetwork'
    ss.public_header_files = 'Pod/Headers/pj++/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjlib/*.a'
    
    ss.dependency 'pjsip-ios/pj'
    ss.dependency 'pjsip-ios/pjlib-util'

  end

  s.subspec 'pjmedia' do |ss|
     
      ss.header_dir = 'pjmedia'
      ss.frameworks = 'AudioToolbox', 'AVFoundation'
      ss.public_header_files = 'Pod/Headers/pjmedia/*.{h,hpp}'
      ss.vendored_libraries = 'Pod/Lib/pjmedia/*.a'
    
      ss.dependency 'pjsip-ios/pj'

    end

  s.subspec 'pjmedia-audiodev' do |ss|
     
    ss.header_dir = 'pjmedia-audiodev'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/Headers/pjmedia-audiodev/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjmedia/*.a'
    
    ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pjmedia-codec' do |ss|
     
    ss.header_dir = 'pjmedia-codec'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/Headers/pjmedia-codec/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjmedia/*.a'
    
    ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pjmedia-videodev' do |ss|
     
    ss.header_dir = 'pjmedia-videodev'
    ss.frameworks = 'AudioToolbox', 'AVFoundation'
    ss.public_header_files = 'Pod/Headers/pjmedia-videodev/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjmedia/*.a'
    
    ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pjnath' do |ss|
     
    ss.header_dir = 'pjnath'
    ss.public_header_files = 'Pod/Headers/pjnath/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjnath/*.a'
    
    ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pjsip' do |ss|
      
    ss.header_dir = 'pjsip'
    ss.public_header_files = 'Pod/Headers/pjsip/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjsip/*.a'

    ss.dependency 'pjsip-ios/pj'
  
  end

  s.subspec 'pjsip-simple' do |ss|
     
    ss.header_dir = 'pjsip-simple'
    ss.public_header_files = 'Pod/Headers/pjsip-simple/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjsip/*.a'
    
    ss.dependency 'pjsip-ios/pj'

  end

  s.subspec 'pjsip-ua' do |ss|
      
    ss.header_dir = 'pjsip-ua'
    ss.public_header_files = 'Pod/Headers/pjsip-ua/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjsip/*.a'

    ss.dependency 'pjsip-ios/pj'
    
  end

  s.subspec 'pjsua-lib' do |ss|
      
    ss.header_dir = 'pjsua-lib'
    ss.public_header_files = 'Pod/Headers/pjsua-lib/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjsip/*.a'
    

    # ss.dependency 'pjsip-ios/pj'
    # ss.dependency 'pjsip-ios/pj++'
    ss.dependency 'pjsip-ios/pjlib-util'
    ss.dependency 'pjsip-ios/pjmedia'
    ss.dependency 'pjsip-ios/pjmedia-audiodev'
    ss.dependency 'pjsip-ios/pjmedia-codec'
    ss.dependency 'pjsip-ios/pjmedia-videodev'
    ss.dependency 'pjsip-ios/pjnath'
    ss.dependency 'pjsip-ios/pjsip'
    ss.dependency 'pjsip-ios/pjsip-simple'
    ss.dependency 'pjsip-ios/pjsip-ua'

  end

  s.subspec 'pjsua2' do |ss|
     
    ss.header_dir = 'pjsua2'
    ss.public_header_files = 'Pod/Headers/pjsua2/*.{h,hpp}'
    ss.vendored_libraries = 'Pod/Lib/pjsip/*.a'
    
    ss.dependency 'pjsip-ios/pjsua-lib'

  end

end