from percol.finder import FinderMultiQueryRegex

percol.view.__class__.PROMPT = property(
    lambda self:
    ur"Q> [a]: <green>%q</green>" if percol.model.finder.case_insensitive
    else ur"Q> [A]: <green>%q</green>"
)

percol.view.prompt_replacees["F"] = \
    lambda self, **args: self.model.finder.get_name()
percol.view.RPROMPT = ur"(%F) [%i/%I]"

percol.view.CANDIDATES_LINE_SELECTED = ("underline", "on_yellow", "black")
percol.view.CANDIDATES_LINE_MARKED = ("underline", "on_red", "black")
percol.view.CANDIDATES_LINE_QUERY = ("on_black", "yellow")

percol.import_keymap({
    "C-i": lambda percol: percol.command.toggle_case_sensitive(),
    "C-r": lambda percol: percol.command.toggle_finder(FinderMultiQueryRegex)
})
