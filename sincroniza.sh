DESTINO="escuelasunidas@cristiancastillo.com:/home/escuelasunidas/crm"
rake asset:packager:build_all
if test $1 = "go"
then
echo "sincronizando relojes pero de verdad "
#le digo al servidor que reinicie el servicio de nuevosecom
touch tmp/restart.txt
rsync -azvr --force --delete --include="tmp/restart.txt" --exclude-from=rsync_exclude.txt ./ $DESTINO
else
echo "haciendo la finta que sincronizo para ver qué pasa A $DESTINO"
rsync -azvr --force --delete --dry-run --exclude-from=rsync_exclude.txt ./ $DESTINO
fi
 
curl -s "http://escuelasunidas.cristiancastillo.com"
