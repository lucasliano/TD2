# Trabajo Práctico: _Time Domain Systems_

### Lucas Liaño - 02/09/2021

## Resolución

### Ejercicio 1

**Describir el funcionamiento del mismo.**

El sistema consiste principalmente de un planificador cooperativo que se encarga de controlar la ejecución de tres tareas.

Una tarea se ocupa de controlar la presión de un boton y generar un código mediante las funciones xorshift32, sha3_Init512, sha3_Update y sha3_Finalize. Luego tenemos una tarea que se encarga de transmitir dicho codigo mediante el puerto serie. Finalmente, existe una tarea que se encarga de togglear un led cada una determinada cantidad de ticks del sistema. 

El sistema tiene un tick de TICKS_SISTEM = 2.

### Ejercicio 2

**Determinar la cantidad de tareas del mismo, si hay intercomunicación entre ellas o algunas de ellas explicar el mecanismo.**

Como se menciona anteriormente, el sistema cuenta con 3 tareas. Solamente se comunican entre sí las tareas _tarea_calculo_ y _tarea_serie_, dado que _tarea_serie_ necesita del código que genero la primer tarea para ser enviado. A su vez, la _tarea_calculo_ se encarga de indicar cuando hay dato disponible para enviar, mediante la variable global 'enviar_serie'.

El mecanismo de intercomunicación es simplemente el uso de variables globales. Según lo conversado en clase, no es necesario utilizar ningun otro IPC debido a que en este diagrama el programador conoce el tiempo y orden de ejecución de cada una de las tareas.


### Ejercicio 3

**Determinar el tick de sistema, el período principal (hiperperíodo) los ciclos secundarios, la carga media del sistema, de cada ciclo secundario y el porcentaje de carga de procesador del planificador.**

Algunos de estos parametros fueron extraidos directamente del código, mientras que otros son extraidos mediante debug del programa.

En particular el tick del sistema es de $T_{sys} = 2ms$ dado que se utiliza el define TICKS_SISTEM = 2 y _HAL_GetTicks()_ retorna el tiempo desde startup en milisegundos.

El peróodo principal del sistema (hiperperíodo) se calcula mediante el mínimo común múltiplo de los periodos secundarios. Los periodos secundarios (denotados con $T_{s}$ para este documento) se definen en la función _agregar_tarea_. 

Por tanto el hiperperíodo queda como:
$$ T_h = mcm(1,1,3) * T_{sys} = 1 * 3 * T_{sys} $$

$$ T_h = 3\ ticks * 2ms = 6ms$$

Para medir el Worst Case Execution Time (WCET) se utilizó el debugger, aprovechando la variable _et_wcet_ dentro del struct _TaskStat_.

Finalmente la peor carga de CPU se calcula a partir de la siguiente ecuación,

$$ U_{MAX} = \dfrac{WCET}{T_{s}} * 100\% $$

A continuación se presenta una tabla con todos los valores:

| Tarea | $T_{s}$ |  WCET |Carga del procesador|
|-------|---------|-------|--------------------|
|Calculo|   2ms   | 3,2ms |       160%         |
| Serie |   2ms   |0,145ms|       7,25%        |
|  Led  |   6ms   |  3us  |       0,05%        |


La carga media del sistema va a ser la suma de las cargas individuales dentro de un periodo. En este caso ese valor es mayor al 100% debido a que el sistema no se encuentra correctamente planificado.

La carga media del CPU es de 167,3%.

### Ejercicio 4

**¿Está planificado correctamente el sistema en la condición que lo encuentra? En caso de que su afirmación sea positiva explique por qué. En caso de que sea negativa modifique el tic de sistema para que la carga media sea menor al 75%**

El sistema no se encuentra correctamente planificado debido a que la tarea **_calculo_** en su peor condición de ejecución no cumple con que la carga del CPU sea menor al 100%.

Si modificamos el tick del sistema, esto ayudará a aumentar el $T_{s}$ de cada tarea, manteniendo constante el el WCET lo que resultará en una disminución de la carga media del CPU.

Si por ejemplo el $T_{sys} = 6ms$, la tabla ahora será la siguiente,

| Tarea | $T_{s}$ |  WCET |Carga del procesador|
|-------|---------|-------|--------------------|
|Calculo|   6ms   | 3,2ms |       53,33%       |
| Serie |   6ms   |0,145ms|       2,41%        |
|  Led  |   18ms  |  3us  |       0,016%       |

Finalmente la carga media del CPU será de 55,75%.

### Ejercicio 5

**Otras opciones que tiene para minimizar (en caso de que lo necesite) la carga de procesador es partir una tarea en varias subtareas y la utilización de tareas multiciclo. ¿Se usa alguna de estas técnicas en el software que está analizando? ¿Utilizaría para esta aplicación en concreto la técnica de partir una tarea en subtareas? ¿Por qué?**


Este sistema no implementa la técnica de división en subtareas ni tampoco tareas multiciclo. 

En este programa sería de utilidad partir la _tarea_calculo_ en subtareas si quisieramos mantener constante el $T_{sys}$. En particular dado que la funcionalidad interna de dicha tarea está claramente modularizada en distitnas funciones que implementan el hash. 

A su vez, debe tenerse en consideración que implementar dicha estrategia en la _tarea_calculo_, que es la tarea primordial de la aplicación, demoraría la entrega de datos ya que se llamaría en el medio del procesamiento del hash a las otras tareas, que no tienen tanta importancia (o que dependen del output de _tarea_calculo_, como es el caso de _tarea_serie_).

### Ejercicio 6

**Utilizando un timer del procesador (cualquiera que no sea el timer dos que se utiliza para el planificador) implemente demoras “sándwich” y aplíquelas a las tareas del sistema.**

Se utilizará el timer 3 para implementar las demoras sándwich. El feature de demora sandwich se implementará dentro de las funciones del planificador. 

Para que el sistema cumpla con las demoras, vamos a agrandar el tick del sistema a 6ms. A su vez aplicaremos las demoras sandwich conforme a los valores de WCET antes obtenidos. Se agrega un poco de tiempo extra para darle un tiempo de sobra al sistema.

| Tarea |  $T_{sandwich}$ |
|-------|-------|
|Calculo| 3,4ms |
| Serie |0,2ms|
|  Led  |  10us  |

### Ejercicio 7

**Genere un pequeño video dónde se vea la medición de los ticks totales de su sistema y agregue su proyecto y video a la actividad del aula virtual.**

En el video es posible observar como la cantidad de ticks totales es 260847. Si aplicamos la siguiente formula,

$$ T = \dfrac{260847}{72MHz} = 3.6228ms$$

Valor equivalente a la suma de las demoras sandwich mas un poquito (correspondiente al scheduler).

![video](lucas_liano_tds.mp4)