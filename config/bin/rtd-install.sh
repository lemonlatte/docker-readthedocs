cd $APPDIR

set -e

unzip /tmp/master.zip >/dev/null 2>/dev/null && \
mv readthedocs.org-master/* readthedocs.org-master/.??* . && \
rmdir readthedocs.org-master

PYTHON=/venv/bin/python
PIP=/venv/bin/pip

cp -f /etc/default/rtd-config.py $APPDIR/config.py
$PIP install -U \
    --allow-external bzr --allow-unverified bzr \
    -r $APPDIR/pip_requirements.txt
$PYTHON manage.py syncdb --noinput
$PYTHON manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@localhost', 'admin')" | $PYTHON manage.py shell
chown -R py $APPDIR
