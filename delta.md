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

```sh
wget https://fias-file.nalog.ru/downloads/2022.03.04/gar_delta_xml.zip -O 2022.03.04_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.03.01/gar_delta_xml.zip -O 2022.03.01_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.25/gar_delta_xml.zip -O 2022.02.25_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.22/gar_delta_xml.zip -O 2022.02.22_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.18/gar_delta_xml.zip -O 2022.02.18_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.15/gar_delta_xml.zip -O 2022.02.15_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.11/gar_delta_xml.zip -O 2022.02.11_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.08/gar_delta_xml.zip -O 2022.02.08_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.04/gar_delta_xml.zip -O 2022.02.04_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.02.01/gar_delta_xml.zip -O 2022.02.01_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.28/gar_delta_xml.zip -O 2022.01.28_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.25/gar_delta_xml.zip -O 2022.01.25_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.21/gar_delta_xml.zip -O 2022.01.21_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.18/gar_delta_xml.zip -O 2022.01.18_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.14/gar_delta_xml.zip -O 2022.01.14_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.11/gar_delta_xml.zip -O 2022.01.11_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.07/gar_delta_xml.zip -O 2022.01.07_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2022.01.04/gar_delta_xml.zip -O 2022.01.04_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.31/gar_delta_xml.zip -O 2021.12.31_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.28/gar_delta_xml.zip -O 2021.12.28_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.24/gar_delta_xml.zip -O 2021.12.24_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.21/gar_delta_xml.zip -O 2021.12.21_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.17/gar_delta_xml.zip -O 2021.12.17_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.14/gar_delta_xml.zip -O 2021.12.14_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.10/gar_delta_xml.zip -O 2021.12.10_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.07/gar_delta_xml.zip -O 2021.12.07_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.12.03/gar_delta_xml.zip -O 2021.12.03_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.30/gar_delta_xml.zip -O 2021.11.30_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.26/gar_delta_xml.zip -O 2021.11.26_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.23/gar_delta_xml.zip -O 2021.11.23_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.19/gar_delta_xml.zip -O 2021.11.19_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.16/gar_delta_xml.zip -O 2021.11.16_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.12/gar_delta_xml.zip -O 2021.11.12_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.09/gar_delta_xml.zip -O 2021.11.09_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.05/gar_delta_xml.zip -O 2021.11.05_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.11.02/gar_delta_xml.zip -O 2021.11.02_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.29/gar_delta_xml.zip -O 2021.10.29_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.26/gar_delta_xml.zip -O 2021.10.26_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.22/gar_delta_xml.zip -O 2021.10.22_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.19/gar_delta_xml.zip -O 2021.10.19_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.15/gar_delta_xml.zip -O 2021.10.15_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.12/gar_delta_xml.zip -O 2021.10.12_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.08/gar_delta_xml.zip -O 2021.10.08_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.05/gar_delta_xml.zip -O 2021.10.05_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.10.01/gar_delta_xml.zip -O 2021.10.01_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.28/gar_delta_xml.zip -O 2021.09.28_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.24/gar_delta_xml.zip -O 2021.09.24_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.21/gar_delta_xml.zip -O 2021.09.21_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.17/gar_delta_xml.zip -O 2021.09.17_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.14/gar_delta_xml.zip -O 2021.09.14_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.10/gar_delta_xml.zip -O 2021.09.10_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.07/gar_delta_xml.zip -O 2021.09.07_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.09.03/gar_delta_xml.zip -O 2021.09.03_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.31/gar_delta_xml.zip -O 2021.08.31_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.27/gar_delta_xml.zip -O 2021.08.27_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.24/gar_delta_xml.zip -O 2021.08.24_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.20/gar_delta_xml.zip -O 2021.08.20_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.17/gar_delta_xml.zip -O 2021.08.17_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.13/gar_delta_xml.zip -O 2021.08.13_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.10/gar_delta_xml.zip -O 2021.08.10_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.06/gar_delta_xml.zip -O 2021.08.06_gar_delta_xml.zip
wget https://fias-file.nalog.ru/downloads/2021.08.03/gar_delta_xml.zip -O 2021.08.03_gar_delta_xml.zip
```