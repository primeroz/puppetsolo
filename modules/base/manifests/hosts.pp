class base::hosts (
  $config   = undef,
  $self     = false,
  ) {

  $defaults = {
    ensure => 'present',
  }

  if $config {
    validate_hash("$config")
    create_resources(host,$config,$defaults)
  }

  $hiera_config = hiera_hash('base::hosts::hosts', undef)
  if $hiera_config {
    create_resources(host,$hiera_config,$defaults)
  }

  #Add Entry for host itself
  if ($base::hosts::self) {
    host { $::fqdn:
      ip            => $::ipaddress,
      host_aliases  => $::hostname,
      ensure        => 'present',
    }
  }
}
