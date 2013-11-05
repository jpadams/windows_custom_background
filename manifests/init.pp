class custom_script {
  file {"make windows dir":
    ensure => directory,
    path   => "C:\audit",
  }
  file {"make images dir":
    ensure => directory,
    path   => "C:\images",
  }
  file {"grab desktop background":
    ensure => present,
    path   => "C:\images\maxresdefault.jpg",
    source => "puppet:///modules/custom_script/maxresdefault.jpg",
    require=> File["make images dir"],  
  }
  file {"windows login script":
    ensure  => present,
    path    => "C:\windows_script.bat",
    source  => "puppet:///modules/custom_script/windows_script.bat",
    require => File["make windows dir"],
  }
  exec {"C:\windows_script.bat":
    command  => "C:\windows_script.bat",
    provider => "windows",
    require  => File["windows login script","grab desktop background"],
  }
}
