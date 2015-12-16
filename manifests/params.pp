class sar::params {
  case $::osfamily
  {
    'redhat':
        {
      case $::operatingsystemrelease
      {
        /^[5-7].*$/:
        {
          $packages=[ 'sysstat' ]
        }
        default: { fail("Unsupported RHEL/CentOS version! - $::operatingsystemrelease")  }
      }

    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              $packages=[ 'sysstat' ]
              $enablefile_debian='/etc/default/sysstat'
            }
            default: { fail("Unsupported Ubuntu version! - $::operatingsystemrelease")  }
          }
        }
        'Debian': { fail("Unsupported")  }
        default: { fail("Unsupported Debian flavour!")  }
      }
    }
    default: { fail("Unsupported OS!")  }
  }
}
