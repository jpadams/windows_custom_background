class windows_custom_background {
  
  file { 'make images dir':
    ensure => directory,
    path   => 'C:/images',
  }
  file { 'grab desktop background':
    ensure => present,
    path   => 'C:/images/maxresdefault.jpg',
    source => 'puppet:///modules/custom_script/maxresdefault.jpg',
    require=> File['make images dir'],  
  }
  file { 'windows login script':
    ensure  => present,
    path    => 'C:/windows_script.bat',
    source  => 'puppet:///modules/custom_script/windows_script.bat',
    require => File['make windows dir'],
  }
  exec { 'run the script':
    command  => 'C:/windows_script.bat',
    require  => File['windows login script','grab desktop background'],
  }
  
}
