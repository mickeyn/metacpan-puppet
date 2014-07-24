# Configure daemon_control resources.
class daemon_control::config (
    $user      = 'metacpan',
    # Symlink local app dir to base dirs (likely on a different mount).
    $link_dirs = true,
) {

    $basename = 'daemon_control'

    $log_dir  =  "/var/log/${basename}"
    $run_dir  =  "/var/run/${basename}"

    file { [
            $log_dir,
            $run_dir,
        ]:
        ensure => directory,
        mode   => '0755',
        owner  => $user,
    }

}
