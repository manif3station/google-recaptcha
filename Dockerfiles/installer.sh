cd /app/src/plugins/google-recaptcha/Dockerfiles
TMP=/tmp cpanm --notest --installdeps .
rm -fr /tmp/.cpanm
