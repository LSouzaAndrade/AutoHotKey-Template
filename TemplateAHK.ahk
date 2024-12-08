#Requires AutoHotkey v2.0
#SingleInstance

CoordMode "Pixel"
CoordMode "Mouse", "Screen"

Esc:: {
    MsgBox "Execução do script cancelada."
    ExitApp
}

FindImage(imagePath) {
    local FoundX, FoundY
    Loop {
        if ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, imagePath) {
            return [FoundX, FoundY]
        }
        Sleep 200
    }
}

try {

    BotaoNovaAba := FindImage(A_ScriptDir "\BotaoNovaAbaOperaGX.png")
    MouseClick "Left", BotaoNovaAba[1], BotaoNovaAba[2], 1

    BarraURL := FindImage(A_ScriptDir "\BarraURLOperaGX.png")
    Send "https://www.amazon.com.br/{Enter}"

    BotaoLivro := FindImage(A_ScriptDir "\BotaoLivrosAmazon.png")
    MouseClick "Left", BotaoLivro[1], BotaoLivro[2], 1

    BarraPesquisa := FindImage(A_ScriptDir "\BarraPesquisaAmazon.png")
    MouseClick "Left", BarraPesquisa[1], BarraPesquisa[2], 1
    Send "Guia do mochileiro das galáxias{Enter}"

    ExitApp

} catch as exc {
    MsgBox "Erro:`n" exc.Message
}
