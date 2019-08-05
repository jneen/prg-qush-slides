require 'rouge'

class Qsh < Rouge::RegexLexer
  tag 'qsh'

  state :root do
    rule /\s+/, Text
    rule /[▮▯]/, Comment::Preproc
    rule /#/, Comment, :comment
    rule /[.][.][.]/, Comment
    rule /[$][\w-]+/, Name::Variable
    rule /[%][\w-]+/, Name::Class
    rule /[?][\w-]+/, Name::Label
    rule /[@][\w-]+/, Keyword
    rule /&\d+/, Name::Tag

    # weird negative lookahead stuff is to not consider `-` as a word boundary
    rule /\b(?<!-)(put|get|for|fan|each|incr|decr|spawn)(?!-)\b/, Name::Builtin
    rule /TODO|XXX/, Error
    rule /\d+(?!-)\b/, Num
    rule /[.\/\w-]+/, Name

    rule /[(){}:\[\]&|=;<>%+!]/, Punctuation

    rule /"/, Str::Double, :dq
  end

  state :comment do
    rule /TODO|XXX/, Error
    rule /\n/, Comment, :pop!

    rule /[^\n]+(?=TODO|XXX)/, Comment
    rule /[^\n]+/, Comment
  end

  state :dq do
    rule /"/, Str::Double, :pop!
    rule /[$][\w-]+/, Name::Variable
    rule /[^"$]+/, Str::Double
  end
end

class CursorScheme < Rouge::Lexers::Scheme
  tag 'cursorscheme'

  prepend :root do
    rule /[▮▯]/, Comment::Preproc
  end
end
