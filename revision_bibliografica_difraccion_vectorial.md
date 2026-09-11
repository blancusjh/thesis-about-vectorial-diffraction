# Revisión bibliográfica: campo focal y aberraciones vectoriales en una superficie estigmática

Fecha: 10 de septiembre de 2026. Documento de trabajo previo a la reescritura de la introducción; no modifica el manuscrito ni pretende certificar una prioridad bibliográfica exhaustiva.

## 1. Problema del trabajo, según el manuscrito

El objetivo es calcular el campo eléctrico en el plano focal de **una superficie refractiva estigmática** y mostrar aberraciones de origen vectorial **aun en sistemas sin aberración de fase**. La composición de operaciones permite plantear aplicaciones a sistemas de varias superficies; no debe sustituir ese objetivo al presentar el trabajo.

La lectura comprende los capítulos activos I, II, III y V, y los apéndices de implementación numérica, condiciones de frontera/Fresnel y Fourier polar. Las observaciones siguientes se apoyan especialmente en:

- [Capítulo II: Helmholtz por componentes cartesianas fijas](/Users/blancus/Scientific/Thesis/00Doc/chapters/II.Optica_Ondulatoria.tex:88), espectro angular y transformación de transmisión dependiente de la dirección incidente y la normal superficial.
- [Capítulo III: expresión del campo focal](/Users/blancus/Scientific/Thesis/00Doc/chapters/III.Campo_en_el_plano_focal_en_un_sistema_estigmatico_simple_refractivo.tex:1020), obtenida a partir de la pupila vectorial transmitida.
- [Capítulo III: separación de los canales isótropo y anisótropo](/Users/blancus/Scientific/Thesis/00Doc/chapters/III.Campo_en_el_plano_focal_en_un_sistema_estigmatico_simple_refractivo.tex:2900), con las combinaciones de Fresnel y las transformadas de Hankel.
- [Apéndice numérico: reconstrucción espectral longitudinal](/Users/blancus/Scientific/Thesis/00Doc/appendices/apen_numerical_algorithm.tex:66).

El estigmatismo del par objeto–imagen no equivale a formación perfecta de imágenes de objetos extendidos. Su interés aquí es proporcionar una geometría cuyo camino óptico ya está controlado y que permite examinar separadamente la transformación vectorial del campo.

## 2. Mapa de antecedentes próximos

| Referencia | Problema que trata | Relación principal con este trabajo |
|---|---|---|
| Song, He y Yuan, 2025 | Espectro angular vectorial; interfaces planas | Afinidad espectral y tratamiento de transversalidad |
| Wang et al., 2020 | Propagación de un campo convergente ya conocido | Separación entre propagación homogénea y modelo de lente |
| Kim, Wang y Zhang, 2018 | Trazado vectorial y evaluación de integrales de difracción | Fresnel y geometría; objetivos idealizados en sus ejemplos |
| Shi, Hellmann y Wyrowski, 2019 | Propagación a través de superficies curvas | Antecedente directo de transmisión local de Fresnel |
| Wende et al., 2022 | Propagación vectorial por volúmenes microópticos | Algoritmo espectral eficiente con fronteras aproximadas |
| González-Acuña, Borne y Thibault, 2022 | Difracción no paraxial del óvalo cartesiano | Antecedente geométrico inmediato; comparación sin Fresnel |
| McGuire y Chipman, 1991 y 1994 | Aberraciones de polarización y respuesta de imagen | Marco conceptual para la pupila matricial |

Los enlaces, alcances y niveles de lectura se detallan abajo. Esta clasificación evita atribuir a un propagador una tarea de cálculo de fronteras que no se propone realizar.

## 3. Song, He y Yuan (2025): coincidencia estructural, no identidad de problemas

Chengda Song, Jing He y Guanghui Yuan, *Generic full-vector angular spectrum method for calculating diffraction of arbitrary electromagnetic fields*, **Journal of Physics: Photonics 7, 045021 (2025)**. [DOI y artículo](https://doi.org/10.1088/2515-7647/ae0384). **Lectura: PDF completo proporcionado por el autor del manuscrito**, incluidos apéndices. Publicado el 18 de septiembre de 2025.

### 3.1 Qué propone y qué conecta con el manuscrito

Song formula la difracción mediante el espectro angular, descompone el campo en polarizaciones transversales a cada vector de onda y escribe una operación matricial espectral. En las ecuaciones (7)–(9) explota simetrías para expresar ciertos campos mediante integrales con Bessel de órdenes 0, 1 y 2. Las ecuaciones (10)–(12) incorporan transmisión de Fresnel y reflexiones múltiples en configuraciones planas.

Hay tres afinidades concretas con el manuscrito: superposición espectral, operaciones vectoriales compatibles con la propagación de componentes cartesianas y reducción Fourier–Hankel mediante simetría. La semejanza de órdenes de Bessel no demuestra identidad del mecanismo físico: pueden proceder de proyecciones geométricas, de transmisión diferencial o de ambas.

La delimitación geométrica es importante: la extensión de Song a interfaces utiliza fronteras planas; no deriva la transmisión sobre un óvalo cartesiano curvo. Tampoco organiza su investigación alrededor de aislar aberraciones de Fresnel en una superficie estigmática sin aberración de fase.

### 3.2 Comprobación matemática de la propagación por componentes

En un medio homogéneo, isotrópico, sin fuentes, para un campo monocromático saliente, sea

\[
\mathbf k=(k_x,k_y,k_z),\qquad k_z=\sqrt{k^2-k_x^2-k_y^2}.
\]

Cada componente cartesiana satisface Helmholtz y se propaga como

\[
\widetilde E_j(k_x,k_y;z)
=e^{ik_z z}\widetilde E_j(k_x,k_y;0).
\]

La restricción electromagnética es

\[
\mathbf k\cdot\widetilde{\mathbf E}=0.
\]

**Deducción de esta revisión:** el mismo factor de propagación conserva esa restricción. Por tanto, propagar componentes cartesianas por separado no constituye por sí mismo una aproximación escalar de la física vectorial. Las componentes no pueden elegirse arbitrariamente e independientemente como datos físicos, aunque compartan propagador.

El operador central de la ecuación (5) de Song puede escribirse, para el espectro propagante, como

\[
\mathbf P(\mathbf k)=\mathbf I-\frac{\mathbf k\mathbf k^{\mathsf T}}{k^2}.
\]

Si el espectro inicial ya es transversal,

\[
\mathbf P\widetilde{\mathbf E}=\widetilde{\mathbf E}.
\]

Así, sobre ese conjunto de campos físicos, la formulación proyectada coincide con la propagación componente a componente. Si el dato inicial no satisface transversalidad, la proyección lo cambia, incluso en el plano inicial. No es equivalente a mantener cualquier distribución vectorial prescrita como condición de frontera exacta.

Esto permite citar Song con precisión: es afín a la estructura espectral del trabajo, pero no debe interpretarse como una demostración de que aplicar Helmholtz a componentes cartesianas físicas pierde necesariamente información vectorial. El propio artículo señala la condición de divergencia nula al discutir su ecuación (2).

En su comparación híbrida con campos procedentes de FDTD, Song reporta diferencias longitudinales entre procedimientos. No he reproducido sus simulaciones. La igualdad algebraica anterior obliga a examinar datos, muestreo y tratamiento espectral antes de atribuir tales diferencias al propagador homogéneo en sí; esta revisión no identifica cuál de esos factores explica los resultados numéricos.

### 3.3 Proyección y refracción son operaciones distintas

En el manuscrito, la transformación local tiene la estructura

\[
\mathbf T(\mathbf x_\Sigma,\widehat{\mathbf k}_i)
=t_s\,\mathbf s_t\mathbf s_i^{\mathsf T}
+t_p\,\mathbf p_t\mathbf p_i^{\mathsf T}.
\]

La dirección transmitida difiere de la incidente y la normal depende del punto superficial. Este operador no es el proyector de transversalidad de Song. Para interfaces planas, la invariancia tangencial permite una descripción particularmente simple en frecuencias transversales; para una superficie curva no se debe inferir una multiplicación espectral global diagonal únicamente de la linealidad del problema.

### 3.4 Desarrollo independiente

Según la aclaración del autor, Song no fue conocido durante la elaboración del trabajo. Puede citarse ahora como trabajo relacionado, usando expresiones como «esta estructura es consistente con formulaciones recientes de espectro angular vectorial», sin afirmar que el método se deriva de Song. La prioridad cronológica de resultados concretos requeriría contrastar versiones fechadas; no se establece mediante la semejanza formal.

## 4. Propagación e interfaces: antecedentes que deben distinguirse

### Wang et al. (2020)

Zongzhao Wang, Olga Baladron-Zorita, Christian Hellmann y Frank Wyrowski, *Generalized Debye integral*, **Optics Express 28, 24459–24470**. [Texto disponible](https://www.researchgate.net/publication/343226841_Generalized_Debye_integral); [DOI](https://doi.org/10.1364/OE.397010). **Lectura contrastada: introducción y desarrollo teórico pertinente, especialmente §2.1.**

Parte del campo detrás de la última lente y estudia su propagación homogénea; no calcula allí la transmisión mediante coeficientes de Fresnel. Explicita el desacoplamiento de las seis componentes respecto del propagador. Su generalización amplía las condiciones del Debye convencional mediante una aproximación de Fourier basada en fase estacionaria. Sirve para separar las limitaciones del propagador de las del modelo de lente, no para afirmar que toda formulación vectorial incorpora fronteras.

### Kim, Yuan Wang y Zhang (2018)

Jeongmin Kim, Yuan Wang y Xiang Zhang, *Calculation of vectorial diffraction in optical systems*, **JOSA A 35, 526–535**. [PDF del grupo](https://xlab.hku.hk/pdf/10.1364_JOSAA.35.000526.pdf). **Lectura: texto completo.**

Combina trazado vectorial mediante matrices de Jones tridimensionales, coeficientes de transmisión/reflexión y evaluación de integrales de difracción. En §3 simplifica objetivos mediante superficies esféricas; §4A utiliza un objetivo aplanático esférico e interfaz plana. Es pertinente la objeción a esa idealización. Sin embargo, el artículo también presenta fuentes dipolares: no sería preciso restringir todo su contenido a un único vector de onda global. No desarrolla la superficie cartesiana del manuscrito.

### Shi, Hellmann y Wyrowski (2019)

Rui Shi, Christian Hellmann y Frank Wyrowski, *Physical-optics propagation through curved surfaces*, **JOSA A 36, 1252–1260**. [Artículo](https://doi.org/10.1364/JOSAA.36.001252). **Lectura: PDF completo de la biblioteca local.**

Separa propagación de entrada, operador de frontera y propagación de salida. Su aproximación local de interfaz plana usa normales de la superficie real, rotaciones y coeficientes de Fresnel; admite una descripción incidente por espectro de ondas planas. Es el antecedente metodológico más cercano encontrado para la operación local de refracción. No presupone una superficie estigmática ni realiza la separación analítica específica del manuscrito.

La aproximación no resuelve todas las interacciones múltiples próximas a la frontera. En un ejemplo bidimensional con superficie de extensión lateral 100 µm y profundidad 20 µm, a 532 nm, reporta **0,2 s frente a 15 min** de elementos finitos, en el mismo computador. Su error normalizado reportado no debe reinterpretarse como una cota universal de error de amplitud. Este caso respalda la importancia computacional de aproximaciones de frontera bien delimitadas.

### Shi y Wyrowski (2019): lentes ideales y reales

*Comparison of aplanatic and real lens focused spots in the framework of the local plane interface approximation*, **JOSA A 36, 1801–1809**. [Artículo](https://doi.org/10.1364/JOSAA.36.001801). **Lectura: resumen e introducción de la vista editorial; no texto completo.**

La introducción describe explícitamente el modelo ideal con transmisiones s y p unitarias y apodización por conservación de energía. El resumen anuncia comparaciones entre lentes reales e ideales y efectos de desalineación. Es una referencia prioritaria para completar la comparación focal; no se le atribuyen aquí detalles de ecuaciones no examinadas.

### Wende et al. (2022)

Marco Wende, Johannes Drozella, Andrea Toulouse y Alois M. Herkommer, *Fast algorithm for the simulation of 3D-printed microoptics based on the vector wave propagation method*, **Optics Express 30, 40161–40173**. [Artículo](https://doi.org/10.1364/OE.469178). **Lectura: PDF completo de la biblioteca local.**

FPWPM propaga un campo vectorial por un volumen discretizado, con matrices espectrales, Fresnel y FFT. No es exclusivo de lentes ideales. Es unidireccional y simplifica términos de inhomogeneidad; §2.3.2 documenta errores en interfaces oblicuas. La tabla 1 reporta 53 min o 12,4 h para una microlente tridimensional, según discretización. Son volúmenes completos, no solo el plano focal. Los tiempos de años que también aparecen son estimaciones de otros procedimientos, no ejecuciones medidas. Su relevancia es mostrar tanto la ganancia de los algoritmos espectrales como el costo y las aproximaciones asociados al tratamiento volumétrico.

## 5. Antecedente directo sobre superficies cartesianas

Rafael G. González-Acuña, Jeck Borne y Simon Thibault, *Nonparaxial diffraction of the Cartesian oval*, **Optical Engineering 61, 055102 (2022)**. [Texto del autor](https://www.researchgate.net/publication/360918839_Nonparaxial_diffraction_of_the_Cartesian_oval); [DOI](https://doi.org/10.1117/1.OE.61.5.055102). **Lectura: desarrollo y resultados del texto disponible.**

Deriva la apodización de óvalos con conjugados finitos e infinitos y calcula campos radial y longitudinal mediante Richards–Wolf para iluminación radial. En p. 055102-6 excluye expresamente Fresnel de la comparación. Impide sostener que no se ha estudiado difracción vectorial cartesiana; no establece la caracterización del canal diferencial de Fresnel presentada en el manuscrito.

Un antecedente de esa línea es Denis Panneton, Guillaume St-Onge, Michel Piché y Simon Thibault, *Exact vectorial model for nonparaxial focusing by arbitrary axisymmetric surfaces*, **JOSA A 33, 801–810 (2016)**. [Artículo](https://doi.org/10.1364/JOSAA.33.000801). **Lectura: resumen editorial.** Combina trazado y Richards–Wolf para superficies axisimétricas, incluso sin foco puntual único. No se ha comprobado aquí su tratamiento de Fresnel; el título «exact» no basta para clasificarlo como solución completa del problema de dispersión electromagnética.

## 6. Referencias de contexto y qué sostienen

### Aberraciones de polarización

James P. McGuire y Russell A. Chipman, *Polarization aberrations. 1. Rotationally symmetric optical systems*, **Applied Optics 33, 5080–5100 (1994)**. [Artículo](https://doi.org/10.1364/AO.33.005080). **Lectura: resumen editorial.** Distingue variaciones de fase, amplitud, diatenuación y retardancia, obtenidas de expansiones de Fresnel. Es un marco terminológico pertinente: aberración de polarización no es sinónimo de aberración de fase.

De los mismos autores, *Diffraction image formation in optical systems with polarization aberrations. II: Amplitude response matrices for rotationally symmetric systems*, **JOSA A 8, 833–840 (1991)**. [Artículo](https://doi.org/10.1364/JOSAA.8.000833). **Lectura: resumen editorial.** Estudia respuestas de imagen para aberraciones de polarización de segundo y cuarto orden, con apertura numérica pequeña. Es una referencia prioritaria para contrastar la matriz de respuesta focal y evitar presentar la existencia general de tales aberraciones como descubrimiento nuevo.

### Límites de Debye

Colin J. R. Sheppard, *Limitations of the paraxial Debye approximation*, **Optics Letters 38, 1074–1076 (2013)**. [Artículo](https://doi.org/10.1364/OL.38.001074). **Lectura: resumen editorial.** Señala errores por omitir términos superiores de desenfoque, incluso a baja apertura. Sustenta una crítica específica al Debye paraxial, no una ausencia universal de Fresnel ni una invalidez de todas las generalizaciones de Richards–Wolf.

### Interfaz plana después del enfoque

P. Török, P. Varga, Z. Laczik y G. R. Booker, *Electromagnetic diffraction of light focused through a planar interface between materials of mismatched refractive indices: an integral representation*, **JOSA A 12, 325–332 (1995)**. [Artículo](https://doi.org/10.1364/JOSAA.12.000325). **Lectura: resumen editorial y localización bibliográfica; comparación de ecuaciones pendiente.** Trata una frontera plana que introduce aberración esférica por diferencia de índices; no equivale a una superficie refractiva estigmática. La página editorial enlaza una errata, que deberá consultarse antes de reutilizar sus fórmulas.

### Utilidad geométrica de las superficies estigmáticas

Alberto Silva-Lora y Rafael Torres, *Aplanatism in stigmatic optical systems*, **Optics Letters 45, 6390–6393 (2020)**. [Artículo](https://doi.org/10.1364/OL.404990). **Lectura: introducción y ejemplo/conclusiones del PDF local.** Formula la condición de aplanatismo para conjuntos de superficies cartesianas y presenta un diseño. La utilidad de estas superficies para construir sistemas aplanáticos es un antecedente concreto, no solamente una posibilidad futura.

De los mismos autores, *Achromatic stigmatism: achromatic Cartesian ovoid*, **JOSA A 39, 1524–1532 (2022)**. [Artículo](https://doi.org/10.1364/JOSAA.460993). **Lectura: resumen editorial.** Establece condiciones de estigmatismo acromático mediante la relación entre forma y dispersión del material. Su función en la introducción sería justificar la clase geométrica, sin atribuir a la tesis la resolución del problema cromático.

## 7. Qué puede afirmarse sobre costo computacional

El costo es parte sustancial de la motivación. Conviene distinguir:

1. Obtener autoconsistentemente los campos en todas las fronteras de un sistema.
2. Evaluar una representación integral cuando esos campos ya se conocen o aproximan.
3. Propagar un campo dado por un medio homogéneo.

Una identidad integral exacta no implica que la obtención de sus datos de frontera sea barata, ni que toda evaluación exacta tenga el costo de una simulación volumétrica. Tampoco existe, a partir de lo revisado, una cota universal de tamaño de «centenares de longitudes de onda» independiente de simetrías, dimensionalidad, algoritmo y recursos.

Song, §4, reporta un plano FFT de 2001 × 2001 dentro de un segundo; también compara cálculos volumétricos con FDTD, con mallas diferentes, y presenta reducciones por simetría. Es evidencia de que el cálculo vectorial espectral puede ser muy rápido, no una comparación experimental con la tesis.

El tiempo inferior a un segundo indicado por el autor debe consignarse con tamaño de pupila y malla focal, polarización, máquina, tolerancia y tratamiento del precomputo. No lo he medido en esta revisión. Su importancia no depende de llamarlo récord universal: resolver eficientemente el observable físico de interés ya constituye una ventaja práctica.

Las 64 horas discutidas anteriormente no deben presentarse como costo de una única refracción sin identificar exactamente qué simulación y cuántas iteraciones abarcan. Los ejemplos de interfaz curva y propagación espectral de esta revisión ofrecen comparaciones más pertinentes.

## 8. Consecuencias para la introducción y delimitación de la contribución

La secuencia argumental respaldada por esta revisión es:

1. Estigmatismo como control del camino óptico para un par de puntos, dentro del problema más amplio de formación de imágenes; utilidad demostrada en diseño aplanático.
2. Ausencia de aberración de fase no suficiente para caracterizar el campo focal: hacen falta amplitudes y polarización transmitidas.
3. Antecedentes separados de propagación homogénea, modelado de fronteras, aberraciones de polarización y difracción cartesiana.
4. Pregunta concreta del trabajo: qué alteraciones focales introduce la transformación vectorial de Fresnel de una superficie estigmática cuando la fase ya carece de aberración.
5. Respuesta: construir su pupila vectorial y calcular el campo focal, separando canales y estados de polarización; composición como aplicación posterior.

**Delimitación propuesta, no declaración de prioridad:** el aporte específico está en la caracterización del campo focal y de las aberraciones vectoriales asociadas a la transmisión de Fresnel en la superficie cartesiana estudiada, bajo las aproximaciones declaradas del manuscrito. No es necesario presentar el trabajo como primer propagador vectorial, primer tratamiento de fronteras curvas o primer estudio vectorial de un óvalo cartesiano.

Abbe puede ocupar una mención breve como referencia del problema difractivo. Que una derivación sea escalar no demuestra, por sí solo, que el tratamiento vectorial elimine la restricción de banda espacial. Tampoco toda reducción de anchura de una componente equivale a mejora de resolución de imagen. Si se discute resolución, deben fijarse observable y criterio; para este trabajo resulta más directo partir de la estructura y anisotropía de la respuesta focal.

## 9. Dos comprobaciones internas pertinentes para la comparación con Song

No se ha realizado una auditoría completa de las demostraciones ni se han cambiado ecuaciones. Hay dos distinciones que conviene conservar al usar la bibliografía:

- **Transversalidad local frente a espectral.** El capítulo III escribe una relación local entre campo radial y longitudinal referida al rayo; el apéndice numérico reconstruye la componente longitudinal en frecuencias. No son automáticamente intercambiables después de la superposición difractiva. La relación con Song debe establecerse con el segundo procedimiento, o justificar cuidadosamente el paso entre representaciones.
- **Apodización común frente a transmisión diferencial.** Comparar con transmisión unitaria cambia tanto la modulación común como la diferencia entre polarizaciones. Para identificar específicamente el canal proporcional a la diferencia de Fresnel, conviene conservar como referencia la misma modulación común. Así se evita atribuir a ese canal toda variación de anchura respecto de una pupila uniforme.

Además, el propagador focal de Fourier del capítulo III se deriva con aproximaciones de Fresnel y amplitud que el propio texto declara. La afinidad con un espectro angular exacto no convierte automáticamente esa expresión focal aproximada en una solución no paraxial exacta.

## 10. Límite de la revisión y lecturas pendientes prioritarias

Se ha contrastado el núcleo del manuscrito con los antecedentes más próximos encontrados, dando prioridad a los textos completos disponibles. Las referencias marcadas «resumen» no se utilizan para atribuir o negar términos específicos de sus ecuaciones.

Antes de formular una afirmación de novedad exhaustiva, las lecturas completas prioritarias pendientes son: Shi y Wyrowski sobre lentes reales/ideales; Panneton et al.; McGuire y Chipman sobre respuesta de imagen; y Török con su errata. También sería necesaria una búsqueda de trabajos posteriores que citen el estudio del óvalo cartesiano. Estas limitaciones no impiden formular ya el problema y la contribución concreta del trabajo, pero sí impiden concluir que nadie ha tratado una combinación determinada de efectos.
