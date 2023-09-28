Run code in browser console:

```js
const trs = $('#GridGarFias > table > tbody > tr')
for (let tr of trs) {
  const a = $(tr).children('td:nth-child(2)').children('a')
  const url = a.attr('href')
  const chunks = url.split('/')
  const fileName = chunks[4] + '_' + chunks[5]
  console.log(`wget ${url} -O ${fileName}`)
}
```

You will get list of shell commands to download.

```sh
wget https://fias-file.nalog.ru/downloads/2022.03.04/gar_delta_xml.zip -O 2022.03.04_gar_delta_xml.zip
....
```