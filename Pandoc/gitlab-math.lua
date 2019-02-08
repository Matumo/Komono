-- Gitlab形式のMarkdown数式をGithub形式に変換する

-- インライン表示の処理
function Math(el)
	if el.mathtype == "InlineMath" then
		if el.text:sub(1, 1) == '`' and el.text:sub(#el.text) == '`' then
			local text = el.text:sub(2, #el.text-1)
			return pandoc.Math(el.mathtype, text)
		end
	end
end

-- ディスプレイ表示の処理
function CodeBlock(el)
	if el.attributes[2][2] == "math" then
		return pandoc.Para({ pandoc.Math("DisplayMath", el.text) })
	end
end