define vimtutor_user($git_repo = "git://github.com/heim/vimtutorial.git") {
  if(!defined(Package["git-core"])) {
    package { "git-core":
      ensure => present,
    }
  }
  if(!defined(Package["libshadow-ruby1.8"])) {
    package { "libshadow-ruby1.8":
      ensure => present,
    }
  }
  exec { "clone-vim-files-for-$name":
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin",
    user => $name,
    group => $name,
    cwd => "/home/$name",
    command => "git clone $git_repo",
    creates => "/home/$name/vimtutorial/.git",
    require => Package["git-core"],
  }
  exec { "update-vimtutor-for-$name": 
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin",
    user => $name,
    group => $name,
    cwd => "/home/$name/vimtutorial",
    command => "git pull origin master",
    require => Exec["clone-vim-files-for-$name"],
  }
  exec { "reset-vimtutor-for-$name":
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin",
    user => $name,
    group => $name,
    cwd => "/home/$name/vimtutorial",
    command => "git reset --hard origin/master",
    require => Exec["update-vimtutor-for-$name"],
  }
  user { $name:
    ensure => present,
    password   => '$6$3tAbWwbE$EJnRmlGvlO7bcXym9f88LPffh0zHR1.Uw6af2HhS0FF5VGol2SIk3D4KQ2uMUPTcgI29DK7EAz28N18rtumm0/',
    shell   => "/bin/bash",
    home    => "/home/$name",
    managehome => true,
    require => Package["libshadow-ruby1.8"],
  }
  file { "/home/$name":
    ensure => directory,
    owner => $name,
    group => $name,
  }
}


vimtutor_user { "user01": }
vimtutor_user { "user02": }
vimtutor_user { "user03": }
vimtutor_user { "user04": }
vimtutor_user { "user05": }
vimtutor_user { "user06": }
vimtutor_user { "user07": }
vimtutor_user { "user08": }
vimtutor_user { "user09": }
vimtutor_user { "user10": }
vimtutor_user { "user11": }
vimtutor_user { "user12": }
vimtutor_user { "user13": }
vimtutor_user { "user14": }
vimtutor_user { "user15": }
vimtutor_user { "user16": }
vimtutor_user { "user17": }
vimtutor_user { "user18": }
vimtutor_user { "user19": }
vimtutor_user { "user20": }
vimtutor_user { "user21": }
vimtutor_user { "user22": }
vimtutor_user { "user23": }
vimtutor_user { "user24": }
vimtutor_user { "user25": }
vimtutor_user { "user26": }
vimtutor_user { "user27": }
vimtutor_user { "user28": }
vimtutor_user { "user29": }
vimtutor_user { "user30": }
