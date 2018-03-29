require 'rouge'

class Qsh < Rouge::RegexLexer
  tag 'qsh'

  state :root do
    rule /\s+/, Text
    rule /#.*$/, Comment
    rule /[$][\w-]+/, Name::Variable
    rule /[%][\w-]+/, Name::Class
    rule /\b(put|get)\b/, Name::Builtin
    rule /[\/\w-]+/, Name
    rule /[(){}\[\]&|=;<>%!]/, Punctuation
  end
end
