note
	description: "Summary description for {LL_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LL_TEST
inherit
	ES_TEST
create
	make
feature
	make

		do
			add_boolean_case(agent test_insert_last)
			add_boolean_case(agent test_insert_at)
			add_boolean_case (agent test_delete_at)
		--	add_violation_case_with_tag(, agent test_x)
		end

feature -- Boolean test cases

test_insert_last: BOOLEAN
	local
		a: STRING
		imp_client: ARRAYED_CONTAINER
	do	--Spaces screw it up
		comment("TEST 1: insert last")
		create imp_client.make
		imp_client.insert_last("Saad")
		a:=imp_client.get_at(1)
		result:= a~"Saad"
		check result end
		imp_client.insert_last("Memes")
		a:=imp_client.get_at(2)
		result := a~"Memes"
		check result end
		imp_client.insert_last("Octave")
		a:=imp_client.get_at(3)
		result:=a~"Octave"
		check result end
	end

test_insert_at: BOOLEAN
	local
		a,b: STRING
		imp_client: ARRAYED_CONTAINER
	do	--Spaces screw it up
		comment("TEST 3: insert_at")
		create imp_client.make
		imp_client.insert_last("Saad")
		--actual test
		imp_client.insert_at(1,"Memes")
		a:=imp_client.get_at(1)
		b:=imp_client.get_at(2)
		result := a~"Memes"
		check result end
		result:= b~"Saad"
		check result end
		imp_client.insert_at(1,"Dank")
		a:=imp_client.get_at(1)
		result := a~"Dank"
		check result end
		a:=imp_client.get_at(2)
		result := a~"Memes"
		check result end
end

test_delete_at : BOOLEAN
	local
		imp_client : ARRAYED_CONTAINER
	do
		comment("TEST 5: delete_at")
		create imp_client.make
		imp_client.insert_last("Saad")
		imp_client.insert_last("Saeed")
		imp_client.insert_last("Memes")

		imp_client.delete_at(2)
		result:= imp_client.count=2 and imp_client.get_at (1)~"Saad" and imp_client.get_at (2)~"Memes"
		check result end
		imp_client.delete_at(1)
		result:= imp_client.count=1 and imp_client.get_at (1)~"Memes"
		check result end
	end

end
