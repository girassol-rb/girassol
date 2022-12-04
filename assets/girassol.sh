#!/bin/bash

GIRASSOLES=( girassol*.png )

create_base_64() {
    echo -n "data:image/png;base64,"
    base64 "$1" | tr -d $"\r\n"
}

create_frame() {
    local image="$1"
    local progression="$2"

    cat <<FRAME
$progression% {
    background-image: url("`create_base_64 "$image"`");
}
FRAME
}

create_frames() {
    local -i n_frames=${#GIRASSOLES[@]}-1
    local -i step=100/$n_frames
    local -i progression

    for (( i=0; i < $n_frames; i++ )); do
        progression=$step*$i
        create_frame ${GIRASSOLES[$i]} $progression
    done
    create_frame ${GIRASSOLES[$n_frames]} 100
}

cat <<EOG
<svg fill="none" viewBox="0 0 800 400" width="800" height="400" xmlns="http://www.w3.org/2000/svg">
	<foreignObject width="100%" height="100%">
		<div xmlns="http://www.w3.org/1999/xhtml">
			<style>
				@keyframes carousel {
					`create_frames`
				}
				.girassol {
					display: flex;
					flex-direction: column;
					align-items: center;
					justify-content: center;
					margin: 0;
					width: 100%;
					height: 400px;
					background-image: url("`create_base_64 girassol.png`");
                    background-repeat: no-repeat;
                    background-size: contain;
					animation: carousel 10s linear infinite;
				}
			</style>
			<div class="girassol">
			</div>
		</div>
	</foreignObject>
</svg>
EOG