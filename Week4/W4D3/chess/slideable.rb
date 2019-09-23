module Slideable
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]]
  DIAGNOL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diaganol_dirs
    DIAGNOL_DIRS
  end

  def moves
    x = pos[1]  #pieces starting position with x and y coords on the board
    y = pos[0]
    possible_moves = []

    direction = move_dirs  #calls the pieces method for which movement
                           #the piece is allowed to execute
    direction.each do |movement|
      possible_moves << [y, x]    #for each type of movement call the grow method
      possible_moves += grow_unblocked_moves_in_dir(y, x, movement)
    end

    possible_moves  #after checking every possible movement with the
                    #piece, return every possible move that can be taken
  end 

  private

  def grow_unblocked_moves_in_dir(dy, dx, m_arr)  #m_arr == "movement_array"
    current_moves = []

    #HORIZONTAL_DIRS = [[1,0], [-1,0], [0,1], [0,-1]] Ex. [1,0] == m_arr
    #DIAGNOL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]  Ex. [1,1] == m_arr
    
    until dy == 7 || dx == 7 || dy == -7 || dx == -7
      if m_arr[0] == 0 || m_arr[1] == 0
        if m_arr[0] > 0 && m_arr[1] == 0
          current_moves << [dy += 1, dx]
        elsif m_arr[0] < 0 && m_arr[1] == 0
          current_moves << [dy -= 1, dx]
        elsif m_arr[1] > 0 && m_arr[0] == 0 
          current_moves << [dy, dx += 1]
        else
          current_moves << [dy, dx -= 1]
        end
      else
        if m_arr[0] == m_arr[1] && m_arr[0] > 0
          current_moves << [dy += 1, dx += 1]
        elsif m_arr[0] == m_arr[1] && m_arr[0] < 0
          current_moves << [dy -= 1, dx -= 1]
        elsif m_arr[0] > m_arr[1]
          current_moves << [dy += 1, dx -= 1]
        else
          current_moves << [dy -= 1, dx += 1]
        end
      end
    end
    current_moves
  end
  
end