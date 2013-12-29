
node basenode {

}

node default inherits basenode {
  $config = {} #PLACEHOLDER

  class { 'base': 
    config => $config,
    stage  => setup,
  }


}
