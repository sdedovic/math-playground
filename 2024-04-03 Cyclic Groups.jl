### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 97955c5e-e49e-406f-9374-9c86d22b25d7
using Printf

# ╔═╡ a82df1b3-1315-40e6-9023-d20dd3420a37
md"""
### Cyclic Groups
Usually cyclic groups use ``x`` multiplication as the operation so we talk about powers. Sometimes we use ``+`` addition and talk about multiples.

#### ``\mathbb{Z}_6^+``
The generators of the group ``\mathbb{Z}_6``, of the multiples of ``\mathbb{Z}`` modulus 6, are defined as:

``\{e, 1a, 2a, ... (n-1)a \}, n = 6``

#### ``\mathbb{Z}_9^\times``
G is a group defined by the map
``n \to a^n``
of ``\mathbb{Z}`` into ``\langle a \rangle``

or

``\{e, a, a^2, ... a^{n-1} \}, n = 9``

"""

# ╔═╡ bb90f38a-cb9b-4b10-bb90-d1362d78e1f7
function test(actual, expected)
	return issetequal(Set(actual), Set(expected))
end

# ╔═╡ 817373ab-0a65-437c-b06b-8dfe4e91edaa
begin
	buffer = IOBuffer()
	for n in 2:17
		elements = [v for v in 0:n-1]
		print(buffer, "``\\mathbb{Z}_{", n, "}^+=\\{", join(elements, ","), "\\}``\n\n")
		for a in elements
			gen = [a*x % n for x in elements]
			if test(elements, gen)
				println(buffer, "\t", a, " is a generator ", "{", join(gen, ","), "}")
			end
		end
	end
	Markdown.parse(seekstart(buffer))
end

# ╔═╡ 6c32394f-53d3-4965-acae-a0a4a4dbd723
begin
	b2 = IOBuffer()
	for n in 2:17
		elements = 1:n-1
		println(b2, "``\\mathbb{Z}_{", n, "}^\\times=\\{", join(elements, ","), "\\}``\n\n")
		for a in elements
			gen = [a^x % n for x in elements]
			if test(elements, gen)
				println(b2, "\t", a, " is a generator ", gen)
			end
		end
	end
	Markdown.parse(seekstart(b2))
end

# ╔═╡ 2271dd95-0af3-41aa-8a65-56d9eaa680c2
begin
	b3 = IOBuffer()
	for n in 2:17
		elements = unique([v for v in 1:n-1 if gcd(v, n) == 1])
		println(b3, "``(\\mathbb{Z}/", n, "\\mathbb{Z})^\\times=\\{", join(elements, ","), "\\}`` \n\n")
		for a in elements
			gen = [a^x % n for x in 1:n-1]
			if test(elements, gen)
				println(b3, "\t", a, " is a generator ", "{", join(gen, ","), "}")
			end
		end
	end
	Markdown.parse(seekstart(b3))
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.2"
manifest_format = "2.0"
project_hash = "f604830d70fa58877def5710c5d1fa32dcb3f998"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═97955c5e-e49e-406f-9374-9c86d22b25d7
# ╟─a82df1b3-1315-40e6-9023-d20dd3420a37
# ╠═bb90f38a-cb9b-4b10-bb90-d1362d78e1f7
# ╠═817373ab-0a65-437c-b06b-8dfe4e91edaa
# ╠═6c32394f-53d3-4965-acae-a0a4a4dbd723
# ╠═2271dd95-0af3-41aa-8a65-56d9eaa680c2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
