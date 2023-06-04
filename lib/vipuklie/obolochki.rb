require_relative "obolochki/version"

module Vipuklie
  module Obolochki
    # Your code goes here...
    class Error < StandardError; end
    class Algorithms

      def graham_scan(points)
        # Находим нижнюю левую точку в массиве точек
        start = points.min_by { |p| [p[1], p[0]] }
      
        # Сортируем остальные точки по полярному углу относительно начальной точки
        sorted_points = points.sort_by { |p| [Math.atan2(p[1] - start[1], p[0] - start[0]), p[0], p[1]] }
      
        stack=[]
        if points.size>=3
        # Инициализируем стек с первыми двумя точками
          stack = [start, sorted_points[1]]
        
      
          # Проходим по остальным точкам и проверяем их вхождение в выпуклую оболочку
          sorted_points[2..-1].each do |p|
            while stack.size > 1 && ccw(stack[-2], stack[-1], p) <= 0
              stack.pop
            end
            stack.push(p)
          end
        end


        stack
      end
      
      # Вспомогательная функция для определения ориентации точек
      def ccw(p1, p2, p3)
        (p2[0] - p1[0]) * (p3[1] - p1[1]) - (p2[1] - p1[1]) * (p3[0] - p1[0])
      end
      
     

      def jarvis_march(points)
        # Находим самую левую точку в массиве точек
        start = points.min_by { |p| p[0] }
      
        # Инициализируем массив, в котором будем хранить выпуклую оболочку
        hull = []
      
        if (points.size>=3)
        current = start
        loop do
          hull << current
          next_point = points[0]
          points.each do |p|
            if p != current && (next_point == current || ccw(current, next_point, p) < 0)
              next_point = p
            end
          end
          current = next_point
          break if current == start
        end
        end
      
        hull
      end
      
      
   
    end
        
  end
end
