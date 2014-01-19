
class r_zol {

    class { 'zol': }

    anchor { 'r_zol::begin': }
    anchor { 'r_zol::end': }

    Anchor['r_zol::begin'] -> Class['zol']
        -> Anchor['r_zol::end']

}

