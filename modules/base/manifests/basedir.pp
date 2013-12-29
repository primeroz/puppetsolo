class base::basedir (
  $config = undef
) {

  $defaults = {
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
  }

  # Create Dirs from config argument hash
  if $config {
    validate_hash("$config")
    create_resources(file,$config,$defaults)
  }

  # Pull daya from HIERA as merged hash
  $hiera_config = hiera_hash('base::basedir::basedirs', undef)
  if $hiera_config {
    create_resources(file,$hiera_config,$defaults)
  }

}
