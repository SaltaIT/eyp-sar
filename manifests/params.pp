class sar::params {

  case $::osfamily
  {
    'redhat':
    {
      $packages=[ 'sysstat' ]
      $enablefile_debian=undef
      $sysstat_conf='/etc/sysconfig/sysstat'
      $sysstat_template="${module_name}/rh/sysstat.erb"
      case $::operatingsystemrelease
      {
        /^5.*$/:
        {
          $sadc_options_default=undef
        }
        /^6.*$/:
        {
          $sadc_options_default='-d'
        }
        /^7.*$/:
        {
          $sadc_options_default='-S DISK'
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
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
            /^1[46].*$/:
            {
              $packages=[ 'sysstat' ]
              $enablefile_debian='/etc/default/sysstat'
              $sysstat_conf='/etc/sysstat/sysstat'
              $sysstat_template="${module_name}/debian/sysstat.erb"
              $sadc_options_default='-S DISK'
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    'Suse':
    {
      case $::operatingsystem
      {
        'SLES':
        {
          case $::operatingsystemrelease
          {
            '11.3':
            {
              $packages=[ 'sysstat' ]
              $enablefile_debian=undef
              $sysstat_conf='/etc/sysstat/sysstat'
              $sysstat_template="${module_name}/rh/sysstat.erb"
              $sadc_options_default=undef
            }
            default: { fail("Unsupported operating system ${::operatingsystem} ${::operatingsystemrelease}") }
          }
        }
        default: { fail("Unsupported operating system ${::operatingsystem}") }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
