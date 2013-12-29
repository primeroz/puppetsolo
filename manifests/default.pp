
node basenode {
  $config = {} #PLACEHOLDER

  include 'stdlib'
  include 'utils'

  class { 'base': 
    config => $config,
    stage  => setup,
  }


  #  anchor { 'basenode::begin': }
  #  anchor { 'basenode::end': }
  #
  #  Anchor['basenode::begin'] 
  #  -> Class['base']
  #  -> Anchor['basenode::end']


}

node default inherits basenode {

}
