class sar (
            $ensure='installed',
            $enabled=true,
          ) inherits params{

  package { $packages:
    ensure => $ensure,
  }

  if ($sar::params::enablefile_debian)
  {
    file { $sar::params::enablefile_debian:
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => inline_template("ENABLED=\"<% if @enabled %>true<% else %>false<% end %>\"\n"),
      require => Package[$packages],
    }
  }

}
