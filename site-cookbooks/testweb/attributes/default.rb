default["web"]["docroot"] = "/var/www/html"

case node["platform_family"]
when "rhel", "fedora"
  default["pkg"]["update"] = "yum update -y"
  default["pkg"]["httpd"]  = "httpd"
  default["pkg"]["php"]    = "php"
when "debian"
  default["pkg"]["update"] = "apt-get update -y"
  default["pkg"]["httpd"]  = "apache2"
  default["pkg"]["php"]    = "php5"
else
  raise
end
