class metacpan_elasticsearch(
) {

  include metacpan_elasticsearch::curator
  include metacpan_elasticsearch::firewall
  include metacpan_elasticsearch::instance

}
