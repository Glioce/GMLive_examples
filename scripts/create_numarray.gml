///create_numarray(value0, ..., value16);

Autor: NiuWeb.
Versión de GM: Studio 1.4.
Descripción: Crea un arreglo numérico a partir de los valores dados.
Estos pueden ser secuencias numéricas (ver más adelante) para facilitar la creación del arreglo.

Ejemplos:
arreglo = create_numarray(3, 7, 12.5, 4.11, 0.91); //etc...
arreglo = create_numarray("2:8"); //2, 3, 4, 5, 6, 7, 8
arreglo = create_numarray("5.5:9*0.25"); //5.5, 5.75, 6, 6.25, 6.5, 6.75, 7, 7.25, 7.5, 7.75, 8, 8.25, 8.5, 8.75, 9
arreglo = create_numarray("11:-5*2"); //11, 9, 7, 5, 3, 1, -1, -3, -5
arreglo = create_numarray(1, 3, 5, "6:9"); //1, 3, 5, 6, 7, 8, 9

var result, index = 0;

var i, j, arg, nbp, scp;
for(i = 0; i < argument_count; i++)
{
    arg = string(argument[i]);
    arg = string_replace_all(arg, " ", "");
    nbp = string_pos(":", arg);
    scp = string_pos("*", arg);
    
    if(nbp)
    {
        num1 = real(string_copy(arg, 1, nbp - 1));
        
        if(scp)
        {
            num2 = real(string_copy(arg, nbp + 1, scp - nbp - 1));
            num3 = abs(real(string_delete(arg, 1, scp)));
        }
        else
        {
            num2 = real(string_copy(arg, nbp + 1, string_length(arg) - nbp + 1));
            num3 = 1;
        }
            
        
        if(num3 == 0) num3 = 1;
        
        move = sign(num2 - num1);
        
        if(move == 0)
        {
            result[index++] = num1;
            continue;
        }
        else if(move == 1)
        {
            for(j = num1; j <= num2; j += num3)
            {
                result[index++] = j;
            }
        }
        else if(move == -1)
        {
            for(j = num1; j >= num2; j -= num3)
            {
                result[index++] = j;
            }
        }
    }
    else
        result[index++] = real(arg);
}
return result;
