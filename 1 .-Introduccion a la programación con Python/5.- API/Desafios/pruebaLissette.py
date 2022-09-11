import requests
import json

url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos"

payload = ""
headers = {
  'Content-Type': 'application/json',
  'x-api-key': 'GmQ12hxdZdBg7S3xoFqGRaLiVFulDVapwv4Hb6tu'
}

response = requests.request("GET", url, headers=headers, data=payload)
respuesta = json.loads(response.text)

lista_imgs = []
cont = 0
for i in respuesta["latest_photos"]:
    cont += 1

    lista_imgs.append(i["img_src"])
    if cont == 25:
        break


def build_web_page(lista_urls):
    
    f = open('holamundo.html','w')

    mensaje1 = """
    <html>
    \t<head>
    \t</head>
    \t<body>
    \t\t<h1>Fotos tomadas con los Rover en Marte</h1>
    \t\t<ul>
    """
    acum = ""
    for url in lista_urls:
        acum += f"\t\t\t\t<li><img src='{url}' width='300' height='250' ></li>\n"

    mensaje2 = """
    \t\t</ul>
    \t</body>
    </html>
    """

    f.write(mensaje1)
    f.write(acum)
    f.write(mensaje2)
    f.close()

build_web_page(lista_imgs)