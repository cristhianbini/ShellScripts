#!/bin/bash

# Importar a biblioteca OpenAI
pip install openai

# Armazenar a chave da API OpenAI em uma variável
export OPENAI_API_KEY="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"

# Loop infinito para o usuário digitar perguntas
while true; do
    # Ler a pergunta do usuário
    echo "Digite sua pergunta:"
    read question
    
    # Usar o modelo GPT-3 para gerar uma resposta
    answer=$(curl -X POST -H "Content-Type: application/json" -d "{\"prompt\":\"$question\",\"model\":\"text-davinci-002\"}" https://api.openai.com/v1/engines/davinci/completions -H "Authorization: Bearer $OPENAI_API_KEY" | jq -r '.choices[0].text')
    
    # Imprimir a resposta do modelo
    echo "Resposta: $answer"
done
