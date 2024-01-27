server {
	# SSL configuration

    listen 443 ssl;
	listen [::]:443 ssl;

    include snippets/snakeoil.conf;
	include snippets/self-signed.conf;

	root /var/www/mydomain;

	index home.html;

	server_name mydomain.com www.mydomain.com;

	location / {
		try_files $uri $uri/ =404;
	}
}
