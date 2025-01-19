# Editor de Texto App

O aplicativo é uma protótipo resultado da evolução da ferramenta de linha de comando para manipulação de texto em arquivos, agora com interface gráfica desenvolvida em SwiftUI. Este projeto foi realizado como parte do Enhancement Challenge, inspirado nas aulas de princípios de design do curso de Desenvolvimento iOS no programa Capacita Brasil. A aplicação traz uma experiência interativa para manipular texto diretamente no app, contemplando diversos elementos visuais e funcionalidades.

## Funcionalidades

- **Inserção de Texto**: Área para digitar ou colar o texto que será manipulado.
- **Contar Palavras**: Exibe a contagem total de palavras no texto inserido.
- **Buscar Palavra**: Permite buscar uma palavra específica e informa o número de ocorrências.
- **Substituir Palavra**: Substitui todas as ocorrências de uma palavra por outra, com confirmação das alterações.
- **Ordenar Palavras**: Ordena as palavras do texto em ordem alfabética.
- **Limpar Texto**: Apaga todo o conteúdo do editor para iniciar um novo trabalho.

## Como Usar

1. **Inicialização do App**:
   Abra o aplicativo **TextEditorApp**. Você verá uma tela inicial com um campo para inserir o texto e botões de ação.

2. **Manipulação do Texto**:

   - **Inserir Texto**:
     Digite ou cole o texto no campo "Insira o texto aqui".

   - **Menu de Opções**:
     Toque no botão **Menu** para acessar as funcionalidades.

3. **Funcionalidades Específicas**:

   - **Contar Palavras**:
     Toque na opção **Contar Palavras** para ver o número total de palavras no texto.

   - **Buscar Palavra**:
     Insira a palavra desejada no campo de busca e toque em **Buscar**. O app exibirá o número de vezes que a palavra aparece no texto.

   - **Substituir Palavra**:
     Preencha os campos "Palavra antiga" e "Palavra nova". Toque em **Substituir** para ver uma prévia da alteração e confirme para aplicar a substituição ao texto.

   - **Ordenar Palavras**:
     Toque em **Ordenar Palavras** para exibir as palavras do texto organizadas em ordem alfabética.

   - **Limpar Texto**:
     Toque no botão **Limpar** para apagar todo o conteúdo do editor.

## Tecnologias Utilizadas

- **Swift**: Linguagem de programação para desenvolvimento iOS.
- **SwiftUI**: Framework para construção da interface gráfica.
- **Arquitetura Declarativa**: Interface baseada em estados e vinculação de dados para atualizações em tempo real.

## Estrutura do Projeto

- **ContentView**: Tela inicial com o editor de texto e o menu de navegação.
- **MenuOptionsView**: Menu principal com as opções de funcionalidades.
- **WordCountView**: Tela dedicada para contar palavras no texto.
- **SearchWordView**: Tela para buscar palavras e exibir suas ocorrências.
- **ReplaceWordView**: Tela para substituir palavras e confirmar alterações no texto.
- **SortWordsView**: Tela para ordenar palavras em ordem alfabética.
