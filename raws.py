import sys

def replace_byte_in_file(filename, old_value, new_value):
    try:
        # Abra o arquivo em modo binário para leitura e gravação
        with open(filename, 'rb+') as file:
            # Leia todo o conteúdo do arquivo
            file_content = bytearray(file.read())

            # Substitua o valor antigo pelo novo valor
            for i in range(len(file_content)):
                if file_content[i] == old_value:
                    file_content[i] = new_value

            # Volte ao início do arquivo e grave o conteúdo modificado
            file.seek(0)
            file.write(file_content)
            file.truncate()

        print(f"Substituição concluída em '{filename}'.")

    except FileNotFoundError:
        print(f"Arquivo '{filename}' não encontrado.")

if len(sys.argv) != 4:
    print("Uso: python replace_byte_in_file.py <arquivo> <valor_antigo> <valor_novo>")
else:
    filename = sys.argv[1]
    old_value = int(sys.argv[2])
    new_value = int(sys.argv[3])
    replace_byte_in_file(filename, old_value, new_value)
