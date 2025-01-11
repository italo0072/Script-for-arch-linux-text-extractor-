# Simulando la funcionalidad de extracion de texto de powertoys

Hacemos una simulancion para ambar verciones con la ligera diferencia de cada una como el copiado automatico al porta papeles
me enfoque en la comodidad aunque con wyland por compatibilidad se ocupa lo que es mas
flameshot que permite tambien hacer captura de pantalla pero con ligeros cambio se hace unextractor de texto
lo que diferenci de el main  que es que ocuamos en x11 es que en flameshot ocupamos confirmar con un enter
se copiara automaticamente al porta papales

# Pasos para installacion y configuracion

installar
Para x11

```bash
sudo pacman -S maim tesseract tesseract-data-spa xclip
```

Para wyland
```bash
sudo pacman -S flameshot tesseract tesseract-data-spa xclip
```

luego deberan un Descargar uno de los dos sh que estan dependiendo su version hubicarlo en un lugar donde sea acesible 
luego aremos que el script sea asesible siempre dependiendo su version para que este comand funcione como esta aca tiene que 
dejarlo en el home donde se encuentra su carpeta de descargar,documentos, ets despues lo puede mover si quieren solo es para este
unico comando
wyland
```bash
chmod +x ~/Wyland_Extractor.sh
```
x11
```bash
chmod +x ~/hX11_Extractio.sh
```

# Acesibilidad
ya siendo ejecutable lo que haremos es asignale un tecla en atajos de teclados en configuraciones 

![image](https://github.com/user-attachments/assets/dd653c27-8801-4c97-bdbe-992721a13901)

anadir nuevo ahi daremos la opcion de script y le daremos donde esta nuestro scrip anteriormente creado 
ya con esto solo queda colocar una combinacion de teclas y darle aplicar
