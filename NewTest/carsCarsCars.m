function [new] = carsCarsCars(old)
fh=fopen(old);
line=fgetl(fh);
newLine=[];
edited= [old(1:end-4) '_corrected.txt'];
    % creates the name for the new file based on the old one
editedFH= fopen(edited,'w');
    % opens the new file to write in it
while ischar(line)    
    while ~isempty(line)
        [word,line]=strtok(line);
        if strcmp(word,'Cars2')
            word= 'Cars Cars';
        elseif strcmp(word,'Cars3')
            word= 'Cars Cars Cars';
        end
        newLine= [newLine ' ' word];        
    end
fprintf(editedFH,'%s\n',newLine(2:end))
newLine=[];
line=fgetl(fh);
end

fclose(fh);
fclose(editedFH);


end

% 
% function [new] = carsCarsCars(old)
% 
% fh= fopen(old,'r');
%     % opens the original file
% line= fgetl(fh);
%     % gets the first line from the original file
% edited= [old(1:end-4) '_corrected.txt'];
%     % creates the name for the new file based on the old one
% editedFH= fopen(edited,'w');
%     % opens the new file to write in it
% while ischar(line)
%     % while working on char lines
%     if any(strfind(line,'Cars2'))
%         % if any have 'Cars2' in them
%         vec= strfind(line,'Cars2');
%             % make a vector of the location where the 'C' in Cars2 appears
%         for x=1:length(vec)
%             % for the length of the location vector
%                 if vec(x)<=(length(line)-5)
%                     % if the value of the vector can be indexed past five
%                     % without erroring
%                     if ~(line(vec(x)+5) >= '0' & line(vec(x)+5) <= '9')
%                         % if the number next to the 2 is not a number
%                         first= line(1:vec(x)+3);
%                             % get the first piece up to where 'Cars' is
%                         last= line(vec(x)+5:end);
%                             % get the last piece where ' [rest]' is
%                         line= [first ' Cars' last];
%                             % put another ' Cars' between
%                     end 
%                 else 
%                     % else just do the same stuff because you don't
%                     % have to worry about something being behing the 2
%                     first= line(1:vec(x)+3);
%                     last= line(vec(x)+5:end);
%                     line= [first ' Cars' last]; 
%                 end
%             if x ~= length(vec)
%                 % if you are not on the last vector number
%                 vec(x+1)= vec(x+1) + 5;
%                     % the next vector number will have 5 added to it to
%                     % account for the ' Cars' addition
%             end
%         end
%     end
%     if any(strfind(line,'Cars3'))
%         % if there are any Cars3
%         vec= strfind(line,'Cars3');
%             % get the index
%         for x=1:length(vec)
%             % for the number of index values
%                 if vec(x)<=(length(line)-5)
%                     % if it won't go out of bounds
%                     if ~(line(vec(x)+5) >= '0' & line(vec(x)+5) <= '9')
%                         % and it is not a number
%                     first= line(1:vec(x)+3);
%                         % do the stuff
%                     last= line(vec(x)+5:end);
%                     line= [first ' Cars Cars' last];
%                         % add another Cars with a space :)
%                     end 
%                 else 
%                     % do it again
%                    first= line(1:vec(x)+3);
%                    last= line(vec(x)+5:end);
%                    line= [first ' Cars Cars' last];
%                 end
%             if x ~= length(vec)
%                 vec(x+1)= vec(x+1) + 10;
%                     % add ten on this time because you added another Cars
%                     % thing to the middle of the piece
%             end
%         end
%     end        
%    fprintf(editedFH,'%s\n',line);
%     % print each line as they come with the newline character
%    line= fgetl(fh);
%     % get the next line
% end 
% fclose(fh);
%     % close the first file handle
% fclose(editedFH);
%     % close the new file handle
% end