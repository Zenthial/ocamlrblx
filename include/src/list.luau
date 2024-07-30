local List = {}

function List.iter<T>(func: (T) -> (), list: { T })
   for _, t in list do
      func(t)
   end
end

function List.map<T, E>(func: (T) -> E, list: { T }): { E }
   local mapped_list = {}
   for _, t in list do
      table.insert(mapped_list, func(t))
   end
   
   return mapped_list
end

function List.exists<T>(func: (T) -> boolean, list: { T }): boolean
   for _, t in list do
      if func(t) then
         return true
      end
   end
   
   return false
end

return List
