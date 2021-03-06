# Changelog

## 0.0.8 - 2015-02-06

Support the future parser.

Contributors to this release: Rike-Benjamin Schuppner, Stig Sandbeck
Mathisen

## 0.0.7 - 2014-12-05

This release adds support for DragonFly BSD, FreeBSD, OpenBSD.

Other changes listed below, per component.

Contributors to this release: Alex Hornung, Chris Roddy, Frank
Groeneveld, Fredrik Thulin, Julien Pivotto, Martin Jackson, Sebastian
Wiesinger, Stig Sandbeck Mathisen

### munin::node

* Add "host_name" parameter to override the host name of the munin
  node.

* Add "file_group" parameter, used for configuration and log files.

* Add "log_dir" parameter.

* Improved handling of "allow" ACL parameter.

### munin::master

* Improved collection logic. Set "collect_nodes" to "mine" to collect
  nodes which are targeted for this master, or "unclaimed" to pick up
  nodes not aimed a specific master.

* Add global tls_* parameters for connecting to nodes.

* Add "dbdir", "htmldir", "rundir" parameters.

* Add "extra_config" parameter, which takes an array of extra
  configuration lines for munin.conf.

### munin::plugin

* Support absolute paths as target for a plugin.

## 0.0.6 - 2014-12-05

* Retracted, had a breaking bug on older (3.4.x) puppet versions.

## 0.0.5 - 2014-03-19

* Support multiple masters with different nodes
  (Thanks: Cristian Gae)

* Support older (1.4.6) munin versions
  (Thanks: Sergio Oliveira)

* Update for compatibility with puppet 3.4
  (Thanks: Harald Skoglund)

* Easier configuration with more parameters. All parameters have
  trivial validation.

### munin::master

- new parameter "config_root". Defaults should match supported
  operating systems.

### munin::plugin

- new parameter "config_root". Defaults should match supported
  operating systems.

### munin::node

- new parameter "address". Default is $::fqdn. This will be used as
  the "address" when registering with the munin master.

- new parameter "config_root". Defaults should match supported
  operating systems.

- new parameter "package_name".  Default should match supported
  operating systems.

- new parameter "service_name".  Default should match supported
  operating systems.

- new parameter "service_ensure". Default is "". Possible values: "",
  "running" or "stopped".

### munin::params

- new class

## 0.0.4 - 2013-08-13

Bugfix for the munin::plugin define.

- Bugfix: Ensure that we can run tests on ruby 1.8.

- Bugfix: No longer requires the class `Munin::Plugins`, which does
  not exist in this module.
  ([#3](https://github.com/ssm/ssm-munin/issues/3))

- The `ensure` attribute no longer defaults to "link". If not set, a
  potentially existing plugin with the same name is not touched.

- Plugin and configuration directories are now configurable.

- Improved rspec tests, which now actually match the documentation.

## 0.0.2 - 2013-06-31

A few pull requests

- Bugfix: Install munin package before creating munin-conf.d directory
  ([#1](https://github.com/ssm/ssm-munin/pull/1))

- Make graph strategy configurable
  ([#2](https://github.com/ssm/ssm-munin/pull/2))

- Improve documentation

## 0.0.1 - 2013-06-02

Initial release
