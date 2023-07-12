# Base image: Build on debian distribution
FROM        debian:buster

# Tell Docker to install nginx package (first update)
RUN         apt-get -y update && apt-get -y install nginx openssl curl

# Create a self certificate
# use self signed public key standard (req -x509), skip passphrase (-nodes), generate certificate & key (-newkey rsa:2048), key is valid for 365 days (-days 365)
# Location to place the generated private key is tosinga.key        (-keyout)
# The generated certificate is placed in tosinga.crt                (-out)
# Common Name field is set to tosinga                               (-subj)
RUN         openssl req -x509 -nodes -newkey rsa:2048 -days 365     \
            -keyout /etc/nginx/tosinga.key                          \
            -out /etc/nginx/tosinga.crt                             \
            -subj "/CN=tosinga.42.fr"
            # -subj "/CN=localhost"

#copy the new config file into the original config file of nginx
copy        ./conf/nginx.conf /etc/nginx/conf.d

# expose port 443 for HTTPS access (only port allowed)
EXPOSE 443

# Specify the default command that runs when the container is started
CMD ["nginx", "-g", "daemon off;"]