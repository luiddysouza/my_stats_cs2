# PRD: MyStats CS2

> **Project ID:** my_stats_cs2
> **Complexity:** STANDARD (score 11/25)
> **Generated:** 2026-04-30
> **Status:** Draft
> **Platform:** Mobile (Flutter — iOS & Android)
> **Traceable to:** `docs/spec/requirements.json`, `docs/spec/complexity.json`

---

## 1. Overview

**MyStats CS2** é um aplicativo mobile Flutter que permite a qualquer usuário consultar as estatísticas das últimas partidas de um jogador de Counter-Strike 2, buscando pelo Steam ID, link de perfil ou URL personalizada Steam.

O MVP não requer login, não tem backend próprio e opera com dados mockados localmente. A arquitetura será projetada para que a substituição do mock por uma API real seja feita sem refatoração das camadas de domínio ou apresentação.

### 1.1 Goals

- *(FR-01)* Permitir busca de jogador por Steam ID, URL de perfil Steam ou URL personalizada
- *(FR-02)* Exibir as últimas 10 partidas do jogador pesquisado
- *(FR-03)* Mostrar stats resumidas (K/A/D/Rating) por partida na listagem
- *(FR-04)* Permitir ver o detalhe completo de uma partida com stats de todos os jogadores
- *(FR-05)* Funcionar com dados mockados que espelham o formato da API futura

### 1.2 Non-Goals (fora do escopo do MVP)

- *(CON-02)* Login com Steam ou qualquer autenticação
- Histórico de buscas salvo localmente
- Comparação entre dois jogadores
- Rankings ou leaderboards
- Notificações push
- Backend próprio
- *(CON-04)* Versão web ou desktop

---

## 2. Requisitos

### 2.1 Requisitos Funcionais

| ID    | Descrição | Prioridade | Critérios de Aceite |
|-------|-----------|------------|---------------------|
| FR-01 | Busca por Steam ID, URL de perfil ou URL personalizada | P0 | AC-01, AC-02, AC-03 |
| FR-02 | Listar as últimas 10 partidas do jogador | P0 | AC-04, AC-05 |
| FR-03 | Stats resumidas por partida na lista (K/A/D/Rating + resultado) | P0 | AC-06 |
| FR-04 | Detalhe da partida com stats de todos os jogadores por time | P0 | AC-07, AC-08 |
| FR-05 | Dados mockados estruturalmente equivalentes à API futura | P0 | AC-09 |

### 2.2 Requisitos Não-Funcionais

| ID     | Categoria      | Requisito | Métrica |
|--------|----------------|-----------|---------|
| NFR-01 | Performance    | Busca retorna resultado em menos de 500ms | < 500ms (mock) |
| NFR-02 | Compatibilidade | App funciona em Android e iOS | CI valida ambas |
| NFR-03 | Usabilidade    | UI responsiva para diferentes tamanhos de tela | Testado em 360dp e 414dp |

### 2.3 Restrições

| ID     | Tipo      | Descrição |
|--------|-----------|-----------|
| CON-01 | Técnica   | Sem backend próprio — dados via API externa (futura) ou mock local |
| CON-02 | Escopo    | Sem autenticação no MVP |
| CON-03 | Escopo    | MVP apenas — sem features extras |
| CON-04 | Técnica   | Plataforma mobile-only (Flutter) |

---

## 3. Critérios de Aceite

| ID    | Dado | Quando | Então |
|-------|------|--------|-------|
| AC-01 | Steam ID válido (ex: `76561198XXXXXXXXX`) | Usuário buscar | App carrega perfil e exibe partidas |
| AC-02 | Link de perfil Steam (`steamcommunity.com/id/xxx` ou `/profiles/xxx`) | Usuário buscar | App carrega perfil e exibe partidas |
| AC-03 | Entrada inválida (texto aleatório) | Usuário buscar | App exibe mensagem de erro adequada |
| AC-04 | Busca bem-sucedida | Após resultado | App exibe lista com até 10 partidas |
| AC-05 | Nenhuma partida encontrada | Após resultado | App exibe estado vazio explícito |
| AC-06 | Qualquer partida na lista | Sempre | Item exibe: kills, assists, deaths, rating e resultado (W/L) |
| AC-07 | Partida na lista | Usuário tocar | App navega para tela de detalhe da partida |
| AC-08 | Tela de detalhe | Sempre | Exibe stats de todos os jogadores organizados por time |
| AC-09 | Mock data | Sempre | Estrutura de dados idêntica ao contrato esperado da API futura |

---

## 4. Domínio

### 4.1 Entidades

```
Player
  ├── steamId: String
  ├── profileUrl: String
  ├── customUrl: String?
  ├── displayName: String
  └── avatarUrl: String

Match
  ├── matchId: String
  ├── map: String
  ├── date: DateTime
  ├── durationMinutes: int
  └── result: MatchResult (win | loss | draw)

PlayerMatchStats
  ├── player: Player
  ├── kills: int
  ├── assists: int
  ├── deaths: int
  ├── rating: double
  ├── headshots: int
  ├── mvpCount: int
  └── score: int
```

### 4.2 Fluxo Principal (Happy Path)

```
Home (barra de busca)
  → [usuário digita e busca]
  → Lista de Partidas (10 itens com K/A/D/Rating)
  → [usuário toca em uma partida]
  → Detalhe da Partida (todos os jogadores por time)
```

### 4.3 Fluxo de Erro

```
Home (barra de busca)
  → [entrada inválida]
  → Mensagem de erro inline ("Jogador não encontrado" / "Entrada inválida")
```

---

## 5. Arquitetura & Stack

> *(Derivado do tech preset Flutter — `.aiox-core/data/tech-presets/flutter.md`)*

**Padrão:** Feature-First Clean Architecture (data → domain → presentation)

**Stack confirmada:**

| Camada | Tecnologia |
|--------|-----------|
| Framework | Flutter 3.x |
| State Management | Riverpod (AsyncNotifier) |
| Navegação | go_router |
| Modelos imutáveis | Freezed + json_serializable |
| HTTP (futuro) | Dio |
| Functional errors | fpdart (Either) |
| Testes | flutter_test + mocktail |

**Features identificadas:**
- `features/search/` — busca e validação de input
- `features/matches/` — lista e detalhe de partidas
- `core/` — router, theme, mock datasource, error types

---

## 6. Divisão em Stories

| Story | Título | Escopo |
|-------|--------|--------|
| 1.1 | Setup do Projeto Flutter | Criar projeto, estrutura de pastas, dependências, roteamento base, tema, mock data |
| 1.2 | Busca de Jogador + Lista de Partidas | Tela Home com busca, validação de input, tela de lista, mock integration |
| 1.3 | Detalhe da Partida | Tela de detalhe, stats por time, navegação de volta |

---

## 7. Suposições

- A API real a ser integrada no futuro seguirá o mesmo formato de dados dos mocks
- O app não precisa salvar histórico de buscas no MVP
- Idioma padrão: português (sem i18n no MVP)
- Dispositivos alvo: smartphones modernos (Android 8+, iOS 14+)

---

## 8. Open Questions

| # | Pergunta | Impacto | Status |
|---|----------|---------|--------|
| OQ-01 | Qual API de CS2 será usada no futuro? (Steam API, Faceit, tracker.gg?) | Define formato do contrato dos mocks | Aberto |
| OQ-02 | O "rating" exibido segue algum padrão específico (HLTV 2.0, Faceit ELO)? | Define cálculo/exibição do valor | Aberto |
| OQ-03 | Haverá suporte a múltiplos idiomas futuramente? | Pode requerer i18n desde o início | Aberto |
